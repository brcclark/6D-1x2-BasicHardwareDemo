
#include <bur/plctypes.h>
#include <astime.h>
#include <WFilter.h>
#include "filter.h"

void WFLowPass(struct WFLowPass* inst){
    
    lowpass_typ* internalptr = (lowpass_typ*) &inst->Internal;
    
    // Update the level and reset the state 
    // on a positive edge of the enable
    if(inst->Enable & !inst->iEnable){
        inst->Internal.level = inst->Level;
        inst->Internal.state = 0.0;
    }
    inst->iEnable = inst->Enable;
    inst->Active = inst->Enable;
    
    // Update the values only while enable is true,
    // otherwise return 0
    if(inst->Enable){
        inst->Internal.input = inst->Input;
        lowpass(internalptr);
        inst->Output = inst->Internal.output;
    }
    else{
        inst->Output = 0.0;
    }
    
}

void WFMovingAverage(struct WFMovingAverage* inst){
    
    float* bufferptr;
    mov_avg_typ* internalptr = (mov_avg_typ*) &inst->Internal;
    
    // Update the data and reset the state 
    // on a positive edge of the enable
    if(inst->Enable & !inst->iEnable){
        memset(&inst->Internal, 0, sizeof(inst->Internal));
        inst->Internal.samples = inst->Samples;
        inst->ipBuffer = inst->pBuffer;
        inst->iBufferSize = inst->BufferSize;
    }
    inst->iEnable = inst->Enable;
    
    // Update the values only while enable is true,
    // otherwise return 0
    if(inst->Enable){
        if(inst->ipBuffer){
            if(inst->Internal.samples){
                bufferptr = (float*) inst->ipBuffer;
                inst->Internal.input = inst->Input;
                mov_avg(internalptr, bufferptr, inst->iBufferSize);
                if(inst->Internal.error){
                    inst->Output = 0.0;
                    inst->ErrorID = wfERR_BUFFER_OVERFLOW;
                    inst->Active = 1;
                }
                else{
                    inst->Output = inst->Internal.output;
                    inst->Error = 0;
                    inst->ErrorID = wfERR_NONE;
                    inst->Active = 0;
                }
            }
            else{
                inst->Output = 0.0;
                inst->Error = 1;
                inst->ErrorID = wfERR_ZERO_LENGTH;
                inst->Active = 0;
            }
        }
        else{
            inst->Output = 0.0;
            inst->Error = 1;
            inst->ErrorID = wfERR_NULLPOINTER;
            inst->Active = 0;
        }
        inst->RequiredBufferSize = (inst->Internal.samples + 2) * sizeof(float);
    }
    else{
        inst->Output = 0.0;
        inst->Error = 0;
        inst->ErrorID = wfERR_NONE;
        inst->Active = 0;
        inst->RequiredBufferSize = 0;
    }
    
}

void WFPredictiveFilter(struct WFPredictiveFilter* inst){
    
    kalman_typ* internalptr = (kalman_typ*) &inst->Internal;
    
    // Update the data and reset the state 
    // on a positive edge of the enable
    if(inst->Enable & !inst->iEnable){
        memset(&inst->Internal, 0, sizeof(inst->Internal));
        inst->Internal.t = inst->Time;
        inst->Internal.sigma_a = inst->SigmaA;
        inst->Internal.sigma_z = inst->SigmaZ;
		inst->Internal.alpha = inst->Alpha;
        inst->Internal.state.x[0] = inst->Input;
    }
    inst->iEnable = inst->Enable;
    inst->Active = inst->Enable;
    
    // Update the values only while enable is true,
    // otherwise return 0
    if(inst->Enable){
        inst->Internal.input = inst->Input;
        kalman(internalptr);
        inst->Output = inst->Internal.output;
        inst->ChangeRate = inst->Internal.velocity;
    }
    else{
        inst->Output = 0.0;
        inst->ChangeRate = 0.0;
    }
    
}

void WFLinearFit(struct WFLinearFit* inst){
    
    fit_typ* internalptr = (fit_typ*) &inst->Internal;
    float* dataptr;
    
    short continue_process;
    unsigned long iteration_number;
    signed long start_time;
    signed long current_time;
    signed long elapsed_time;
    int status;
    
    signed long total_length = inst->DataSize / sizeof(float);
	
    switch(inst->State){
		
        case wfFIT_STATE_WAIT:
			
            //The function block is not busy
            inst->Busy = 0;
        		
            //Reset the Done bit and errors when the execute signal goes low
            if(!inst->Execute){
                inst->Done = 0;
                inst->Error = 0;
                inst->ErrorID = wfERR_NONE;
            }
        		
            //Check for execute command and copy parameters
            if(inst->Execute & !inst->iExecute){
                //The function block is busy
                inst->Busy = 1;
                inst->ipDataX = inst->pDataX;
                inst->ipDataY = inst->pDataY;
                inst->iDataSize = inst->DataSize;
                inst->Counter = 0;
                linearfitinit(internalptr);
                if(inst->ipDataX & inst->ipDataY){
                    if(inst->iDataSize){
                        inst->State = wfFIT_STATE_PROCESS;
                    }
                    else{
                        inst->Error = 1;
                        inst->ErrorID = wfERR_ZERO_LENGTH;
                    }
                }
                else{
                    inst->Error = 1;
                    inst->ErrorID = wfERR_NULLPOINTER;
                }
            }
            
            break;
		
        case wfFIT_STATE_PROCESS:
		
            //Reset the iteration number and start time
            iteration_number = 0;
            start_time = clock_ms();
            elapsed_time = 0;
                    		
            do{
        			
                //Get the data values
                dataptr = (float*) inst->ipDataX;
                inst->Internal.x = dataptr[inst->Counter];
                dataptr = (float*) inst->ipDataY;
                inst->Internal.y = dataptr[inst->Counter];
                status = linearfitupdate(internalptr);
        						
                if(status){
                    inst->Error = 1;
                    inst->ErrorID = wfERR_FIT_CALCULATION;
                    inst->State = wfFIT_STATE_WAIT;
                }
        				
                //Increment the counter, iteration number, and time
                inst->Counter += 1;
                iteration_number += 1;
                current_time = clock_ms();
                elapsed_time = current_time - start_time;
        				
                //Check for completion
                if(inst->Counter >= total_length){
                    status = linearfitfinal(internalptr);
                    if(status){
                        inst->Error = 1;
                        inst->ErrorID = wfERR_FIT_CALCULATION;
                    }
                    if(!inst->Error){
                        //Return results if error-free
                        inst->A = inst->Internal.a;
                        inst->B = inst->Internal.b;
                        inst->Done = 1;
                    }
                    inst->State = wfFIT_STATE_WAIT;
                }
        				
                continue_process = (iteration_number < inst->Par.MaxIterations) &
                                   (elapsed_time < inst->Par.MaxTime) & 
                                   (inst->Counter < total_length) &
                                   !inst->Error;
        				
            }while(continue_process);
    
            break;
		
    }

    inst->iExecute = inst->Execute;

}

void WFExponentialFit(struct WFExponentialFit* inst){
    
    fit_typ* internalptr = (fit_typ*) &inst->Internal;
    float* dataptr;
    
    short continue_process;
    unsigned long iteration_number;
    signed long start_time;
    signed long current_time;
    signed long elapsed_time;
    int status;
    
    signed long total_length = inst->DataSize / sizeof(float);
	
    switch(inst->State){
		
        case wfFIT_STATE_WAIT:
			
            //The function block is not busy
            inst->Busy = 0;
        		
            //Reset the Done bit and errors when the execute signal goes low
            if(!inst->Execute){
                inst->Done = 0;
                inst->Error = 0;
                inst->ErrorID = wfERR_NONE;
            }
        		
            //Check for execute command and copy parameters
            if(inst->Execute & !inst->iExecute){
                //The function block is busy
                inst->Busy = 1;
                inst->ipDataX = inst->pDataX;
                inst->ipDataY = inst->pDataY;
                inst->iDataSize = inst->DataSize;
                inst->Counter = 0;
                exponentialfitinit(internalptr);
                if(inst->ipDataX & inst->ipDataY){
                    if(inst->iDataSize){
                        inst->State = wfFIT_STATE_PROCESS;
                    }
                    else{
                        inst->Error = 1;
                        inst->ErrorID = wfERR_ZERO_LENGTH;
                    }
                }
                else{
                    inst->Error = 1;
                    inst->ErrorID = wfERR_NULLPOINTER;
                }
            }
            
            break;
		
        case wfFIT_STATE_PROCESS:
		
            //Reset the iteration number and start time
            iteration_number = 0;
            start_time = clock_ms();
            elapsed_time = 0;
                    		
            do{
        			
                //Get the data values
                dataptr = (float*) inst->ipDataX;
                inst->Internal.x = dataptr[inst->Counter];
                dataptr = (float*) inst->ipDataY;
                inst->Internal.y = dataptr[inst->Counter];
                status = exponentialfitupdate(internalptr);
        						
                if(status){
                    inst->Error = 1;
                    inst->ErrorID = wfERR_FIT_CALCULATION;
                    inst->State = wfFIT_STATE_WAIT;
                }
        				
                //Increment the counter, iteration number, and time
                inst->Counter += 1;
                iteration_number += 1;
                current_time = clock_ms();
                elapsed_time = current_time - start_time;
        				
                //Check for completion
                if(inst->Counter >= total_length){
                    status = exponentialfitfinal(internalptr);
                    if(status){
                        inst->Error = 1;
                        inst->ErrorID = wfERR_FIT_CALCULATION;
                    }
                    if(!inst->Error){
                        //Return results if error-free
                        inst->A = inst->Internal.a;
                        inst->B = inst->Internal.b;
                        inst->Done = 1;
                    }
                    inst->State = wfFIT_STATE_WAIT;
                }
        				
                continue_process = (iteration_number < inst->Par.MaxIterations) &
                    (elapsed_time < inst->Par.MaxTime) & 
                    (inst->Counter < total_length) &
                    !inst->Error;
        				
            }while(continue_process);
    
            break;
		
    }

    inst->iExecute = inst->Execute;

}
