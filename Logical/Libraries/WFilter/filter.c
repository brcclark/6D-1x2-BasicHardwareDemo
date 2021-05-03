/*
 ============================================================================
 Name        : filter.c
 Author      : B&R Industrial Automation
 Version     :
 Copyright   : 
 Description : Filter programs
 ============================================================================
 */

#include "filter.h"

BUILD_DLL int lowpass(struct lowpass* inst) {
	/*
	 * Implements a low pass filter
	*/
    float levelfactor;
    levelfactor = (float)(1.0 / (pow(2.0, (double) inst->level)));
    inst->output = ((inst->input - inst->state) * levelfactor) + inst->state;
    inst->state = inst->output;
    return 0;
}

int buflen(bufferstate_typ* bufferstate, unsigned long maxlen) {
	/*
	 * Returns the current length of the ring buffer
	*/
    int length;
    length = bufferstate->write - bufferstate->read;
    if(length < 0) {
        length += maxlen;
    }
    return length;
}

int bufappend(bufferstate_typ* bufferstate, float* buffer, unsigned long maxlen, float value) {
	/*
	 * Append a value to the ring buffer
	*/
    buffer[bufferstate->write] = value;
    bufferstate->write = (bufferstate->write + 1) % maxlen;
    return 0;
}

float bufpop(bufferstate_typ* bufferstate, float* buffer, unsigned long maxlen) {
	/*
	 * Returns and removes the first item from the ring buffer
	*/
    float value;
    value = buffer[bufferstate->read];
    bufferstate->read = (bufferstate->read + 1) % maxlen;
    return value;
}

BUILD_DLL int mov_avg(struct mov_avg* inst, float* buffer, unsigned long bufferlen) {
	/*
	 * Implements a moving average filter
	*/
    float divval;
    unsigned long maxlen = bufferlen / sizeof(float);

    if(maxlen < (inst->samples + 2)) {
        inst->error = 1;
        return 1;
    }
    else {
        inst->error = 0;
    }

    if(inst->samples > 0) {
        divval = inst->input / inst->samples;
        bufappend(&inst->state.bufferstate, buffer, maxlen, divval);
        if (buflen(&inst->state.bufferstate, maxlen) > inst->samples) {
            divval -= bufpop(&inst->state.bufferstate, buffer, maxlen);
        }
        divval += inst->state.output;
        inst->output = divval;
        inst->state.output = divval;
    }
    return 0;
}

float second_order_fir(float input, float a[2], float b[3], second_order_fir_state_typ* state) {
	/*
	 * Implements a second order FIR filter
	*/
    float output;

    output = (input * b[0]) + (state->input[0] * b[1]) + (state->input[1] * b[2]) +
        (state->output[0] * a[0]) + (state->output[1] * a[1]);

    state->input[1] = state->input[0];
    state->input[0] = input;

    state->output[1] = state->output[0];
    state->output[0] = output;

    return output;
}

float cascade_fir(float input, float a[4][2], float b[4][3], second_order_fir_state_typ state[4]) {
	/*
	 * Implements a cascade of four second order FIR filters
	*/
int i;
float intermediate[4];

for(i = 0; i < 4; i++) {

        if(i > 0) {
intermediate[i] = second_order_fir(intermediate[i - 1], a[i], b[i], state + i);
        }
        else {
intermediate[i] = second_order_fir(input, a[i], b[i], state + i);
        }

    }

return intermediate[3];
}

BUILD_DLL int notch_fir(struct notch_fir* inst) {
	/*
	 * Implements a notch filter using a cascade of four second order FIR filters
	*/
    float a_50Hz_40dB[4][2] = {{1.993991099002, -0.997449015889},
        {1.992719432869, -0.997122121373},
        {1.989918295292, -0.993622497931},
        {1.989201706440, -0.993295984254}
        };

    float a_50Hz_60dB[4][2] = {{1.993792556381, -0.997261542221},
        {1.992532991646, -0.996920780978},
        {1.989453530594, -0.993161909468},
        {1.988733858877, -0.992821608511}
        };

    float a_50Hz_80dB[4][2] = {{1.993728075618, -0.997200655249},
        {1.992472700971, -0.996855673897},
        {1.989302815679, -0.993012548252},
        {1.988582415484, -0.992668052597}
        };

    float a_60Hz_40dB[4][2] = {{1.992325153524, -0.997421548427},
        {1.990918758069, -0.997149580589},
        {1.988199921793, -0.993594951604},
        {1.987460059960, -0.993323522293}
        };

    float a_60Hz_60dB[4][2] = {{1.992123011711, -0.997232903629},
        {1.990736250797, -0.996949410606},
        {1.987733301547, -0.993133190117},
        {1.986994878892, -0.992850318851}
        };

    float a_60Hz_80dB[4][2] = {{1.992057387679, -0.997171660034},
        {1.990677211885, -0.996884659925},
        {1.987582008256, -0.992983471531},
        {1.986844276615, -0.992697120082}
        };

    float b_50Hz_40dB[4][3] = {{0.997682591232, -1.991694270059, 0.997682591232},
        {0.997682591232, -1.991225875619, 0.997682591232},
        {0.997682591232, -1.991562861801, 0.997682591232},
        {0.997682591232, -1.991368918450, 0.997682591232}
        };

    float b_50Hz_60dB[4][3] = {{0.997516583626, -1.991267524831, 0.997516583626},
        {0.997516583626, -1.990999323659, 0.997516583626},
        {0.997516583626, -1.991190872529, 0.997516583626},
        {0.997516583626, -1.991079793498, 0.997516583626}
        };

    float b_50Hz_80dB[4][3] = {{0.997462788341, -1.991103458477, 0.997462788341},
        {0.997462788341, -1.990951762853, 0.997462788341},
        {0.997462788341, -1.991059637418, 0.997462788341},
        {0.997462788341, -1.990996805483, 0.997462788341}
        };

    float b_60Hz_40dB[4][3] = {{0.997682591234, -1.990009760159, 0.997682591234},
        {0.997682591234, -1.989447061155, 0.997682591234},
        {0.997682591234, -1.989850731814, 0.997682591234},
        {0.997682591234, -1.989617713958, 0.997682591234}
        };

    float b_60Hz_60dB[4][3] = {{0.997516583631, -1.989563160946, 0.997516583631},
        {0.997516583631, -1.989240931265, 0.997516583631},
        {0.997516583631, -1.989470683554, 0.997516583631},
        {0.997516583631, -1.989337222874, 0.997516583631}
        };

    float b_60Hz_80dB[4][3] = {{0.997462788347, -1.989387454539, 0.997462788347},
        {0.997462788347, -1.989205194537, 0.997462788347},
        {0.997462788347, -1.989334681058, 0.997462788347},
        {0.997462788347, -1.989259188525, 0.997462788347}
        };

    switch(inst->mode) {

        case 0: //50 Hz, 40 dB
            inst->output = cascade_fir(inst->input, a_50Hz_40dB, b_50Hz_40dB, inst->state);
            break;

        case 1: //50 Hz, 60 dB
            inst->output = cascade_fir(inst->input, a_50Hz_60dB, b_50Hz_60dB, inst->state);
            break;

        case 2: //50 Hz, 80 dB
            inst->output = cascade_fir(inst->input, a_50Hz_80dB, b_50Hz_80dB, inst->state);
            break;

        case 3: //60 Hz, 40 dB
            inst->output = cascade_fir(inst->input, a_60Hz_40dB, b_60Hz_40dB, inst->state);
            break;

        case 4: //60 Hz, 60 dB
            inst->output = cascade_fir(inst->input, a_60Hz_60dB, b_60Hz_60dB, inst->state);
            break;

        case 5: //60 Hz, 80 dB
            inst->output = cascade_fir(inst->input, a_60Hz_80dB, b_60Hz_80dB, inst->state);
            break;

    }
    return 0;
}

int dot_product(float a[2][2], float b[2][2], float output[2][2]) {
	/*
	 * Take the dot product of two 2x2 matrices
	 */
output[0][0] = (a[0][0] * b[0][0]) + (a[0][1] * b[1][0]);
output[0][1] = (a[0][0] * b[0][1]) + (a[0][1] * b[1][1]);
output[1][0] = (a[1][0] * b[0][0]) + (a[1][1] * b[1][0]);
output[1][1] = (a[1][0] * b[0][1]) + (a[1][1] * b[1][1]);
	return 0;
}

int transpose(float input[2][2], float output[2][2]) {
	/*
	 * Transpose the input 2x2 matrix
	 */
output[0][0] = input[0][0];
output[0][1] = input[1][0];
output[1][0] = input[0][1];
output[1][1] = input[1][1];
	return 0;
}

int add_matrix(float a[2][2], float b[2][2], float output[2][2]) {
	/*
	 * Add two 2x2 matrices together
	 */
output[0][0] = a[0][0] + b[0][0];
output[0][1] = a[0][1] + b[0][1];
output[1][0] = a[1][0] + b[1][0];
output[1][1] = a[1][1] + b[1][1];
	return 0;
}

int scale_matrix(float a, float b[2][2], float output[2][2]) {
	/*
	 * Multiply a 2x2 matrix by a scalar
	 */
output[0][0] = a * b[0][0];
output[0][1] = a * b[0][1];
output[1][0] = a * b[1][0];
output[1][1] = a * b[1][1];
	return 0;
}

int kalman_update(float input, kalman_state_typ* state, float R) {
    /*
     * Add a new measurement input to the Kalman filter.
     *
     * Parameters
     * ----------
     * input : measurement for this update.
     * state : kalman filter state
     * R : Measurement noise matrix
    */

    float y;
    float S;
    float K[2];
    float I_KH[2][2];
    float I_KHT[2][2];
    float KRKT[2][2];
    float intermediate[2][2];
    float dot3[2][2];

    // error (residual) between measurement and prediction
    y = input - state->x[0];

    // project system uncertainty into measurement space
    S = state->P[0][0] + R;

    // map system uncertainty into kalman gain
    if(S != 0) {
        K[0] = state->P[0][0] / S;
        K[1] = state->P[1][0] / S;
    }

    // predict new x with residual scaled by the kalman gain
    state->x[0] = state->x[0] + (K[0] * y);
    state->x[1] = state->x[1] + (K[1] * y);

    // P = (I-KH)P(I-KH)' + KRK'
    I_KH[0][0] = 1 - K[0];
    I_KH[0][1] = 0;
    I_KH[1][0] = -K[1];
    I_KH[1][1] = 1;

    transpose(I_KH, I_KHT);

    KRKT[0][0] = R * K[0] * K[0];
    KRKT[0][1] = R * K[0] * K[1];
    KRKT[1][0] = R * K[0] * K[1];
    KRKT[1][1] = R * K[1] * K[1];

    dot_product(state->P, I_KHT, intermediate);
    dot_product(I_KH, intermediate, dot3);
    add_matrix(dot3, KRKT, state->P);

    return 0;

}

int kalman_predict(kalman_state_typ* state, float F[2][2], float Q[2][2], float alpha) {
    /*
     * Predict next position using the Kalman filter state propagation
     * equations.
     *
     * Parameters
     * ----------
     * state : kalman filter state
     * F : State Transition matrix
     * Q : Process noise matrix
     * alpha : Fading memory setting. 1.0 gives the normal Kalman filter, and
     *         values slightly larger than 1.0 (such as 1.02) give a fading
     *         memory effect - previous measurements have less influence on the
     *         filter's estimates. This formulation of the Fading memory filter
     *         (there are many) is due to Dan Simon
    */
	
	float FT[2][2];
	float intermediate[2][2];
	float dot3[2][2];
	
	state->x[0] = (state->x[0] * F[0][0]) + (state->x[1] * F[0][1]);
	state->x[1]	= (state->x[0] * F[1][0]) + (state->x[1] * F[1][1]);

	transpose(F, FT);
	dot_product(state->P, FT, intermediate);
    dot_product(F, intermediate, dot3);
    scale_matrix(alpha * alpha, dot3, intermediate);
    add_matrix(intermediate, Q, state->P);

    return 0;

}

BUILD_DLL int kalman(struct kalman* inst) {
	/*
	 * Implement a Kalman filter
	*/

    float intermediate[2][2];

    // Update the matrices if the inputs have changed
    if((inst->t != inst->internal.t) ||
        (inst->sigma_a != inst->internal.sigma_a) ||
    (inst->sigma_z != inst->internal.sigma_z) ||
	(inst->alpha != inst->internal.alpha)) {

        intermediate[0][0] = (float)(pow((double) inst->t, 4.0) / 4.0);
        intermediate[0][1] = (float)(pow((double) inst->t, 3.0) / 2.0);
        intermediate[1][0] = (float)(pow((double) inst->t, 3.0) / 2.0);
        intermediate[1][1] = (float)(pow((double) inst->t, 2.0));

        scale_matrix(inst->sigma_a * inst->sigma_a, intermediate, inst->internal.Q);

        inst->internal.R = inst->sigma_z * inst->sigma_z;

        inst->internal.F[0][0] = 1;
        inst->internal.F[0][1] = inst->t;
        inst->internal.F[1][0] = 0;
        inst->internal.F[1][1] = 1;

        inst->internal.t = inst->t;
        inst->internal.sigma_a = inst->sigma_a;
        inst->internal.sigma_z = inst->sigma_z;
		inst->internal.alpha = inst->alpha;

    }

    kalman_predict(&inst->state, inst->internal.F, inst->internal.Q, inst->internal.alpha);
    kalman_update(inst->input, &inst->state, inst->internal.R);

    inst->output = inst->state.x[0];
    inst->velocity = inst->state.x[1];

    return 0;
}

BUILD_DLL int linearfitinit(struct fit* inst) {
    /*
     * Initialize the reference data for a linear fit
     */
    memset(inst, 0, sizeof(*inst));

    return 0;
}

BUILD_DLL int linearfitupdate(struct fit* inst) {
    /*
     * Update the reference data for a linear fit
     */
    inst->state.n += 1;
    inst->state.sumx += inst->x;
    inst->state.sumx2 += inst->x * inst->x;
    inst->state.sumy += inst->y;
    inst->state.sumxy += inst->x * inst->y;

    return 0;
}

BUILD_DLL int linearfitfinal(struct fit* inst) {
	/*
	 * Finalize the data for a linear fit
	 * in the form of y = ax + b
	 */

    if(((inst->state.n * inst->state.sumx2) - (inst->state.sumx * inst->state.sumx))){
        inst->a = ((inst->state.n * inst->state.sumxy) - (inst->state.sumx * inst->state.sumy)) /
            ((inst->state.n * inst->state.sumx2) - (inst->state.sumx * inst->state.sumx));
    }
    else{
        inst->a = 0;
        inst->b = 0;
        return 1;
    }

    if(inst->state.n){
        inst->b = (inst->state.sumy - (inst->a * inst->state.sumx)) / inst->state.n;
    }
    else{
        inst->b = 0;
        return 1;
    }

    return 0;
}

BUILD_DLL int exponentialfitinit(struct fit* inst) {
    /*
     * Initialize the reference data for an exponential fit
     */
    memset(inst, 0, sizeof(*inst));

    return 0;
}

BUILD_DLL int exponentialfitupdate(struct fit* inst) {
    /*
     * Update the reference data for an exponential fit
     */
    float Y;

    if(inst->y > 0){
        Y = log(inst->y);

        inst->state.n += 1;
        inst->state.sumx = inst->state.sumx + inst->x;
        inst->state.sumx2 = inst->state.sumx2 + (inst->x * inst->x);
        inst->state.sumy = inst->state.sumy + Y;
        inst->state.sumxy = inst->state.sumxy + (inst->x * Y);
    }
    else{
        inst->b = 0;
        inst->a = 0;
        return 1;
    }

    return 0;
}

BUILD_DLL int exponentialfitfinal(struct fit* inst) {
	/*
	 * Finalize the data for an exponential fit
	 * in the form of y = a*e^bx
	 */
    float A;

    if(((inst->state.n * inst->state.sumx2) - (inst->state.sumx * inst->state.sumx))){
        A = ((inst->state.sumx2 * inst->state.sumy) - (inst->state.sumx * inst->state.sumxy)) /
            ((inst->state.n * inst->state.sumx2) - (inst->state.sumx * inst->state.sumx));

        inst->b = ((inst->state.n * inst->state.sumxy) - (inst->state.sumx * inst->state.sumy)) /
            ((inst->state.n * inst->state.sumx2) - (inst->state.sumx * inst->state.sumx));

        inst->a = exp(A);
    }
    else{
        inst->b = 0;
        inst->a = 0;
        return 1;
    }

    return 0;
}

int main(void) {
    return 0;
}
