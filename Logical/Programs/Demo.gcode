(General flow of logic for the program)
	(Move to Pick up a product)
	(Move to the Sync Area)
	(Wait for InSync Signal)
	(InSync process Start)
	(InSync process End)
	(Check to see if still in Run, if so, head back to Pick up a product otherwise exit the routine)

def plc_global path_synch RobotPickPlaceTyp gPickPlaceIf


DEFINE MoveAbsB AS G90 G01 G126
DEFINE MoveRelB AS G91 G01 G126

G71 (Set the units to mm)
SET_PCS[TrakSync] (Set the frame to be in the TrakSync Frame for ease of operation)
$WHILE TRUE

	$IF gPickPlaceIf.Run
		def REAL parEmptyFeed = gPickPlaceIf.Pars.EmptySpeed.Vel * 60
		def REAL parProductFeed = gPickPlaceIf.Pars.ProductSpeed.Vel * 60

		(Move to Pick up a product)
		N101 def REAL parPickRadius 	= gPickPlaceIf.Pars.PickTune.Radius
		N102 def REAL parPickDwell 		= gPickPlaceIf.Pars.PickTune.DwellTime
		N103 def REAL parPickApproach 	= gPickPlaceIf.Config.PickLoc.Z + gPickPlaceIf.Pars.PickTune.ApproachHeight 
		N104 def REAL parPickDepart 	= gPickPlaceIf.Config.PickLoc.Z + gPickPlaceIf.Pars.PickTune.DepartHeight
		N105 def REAL parPickX 			= gPickPlaceIf.Config.PickLoc.X + gPickPlaceIf.Pars.PickTune.XTune
		N106 def REAL parPickY 			= gPickPlaceIf.Config.PickLoc.Y + gPickPlaceIf.Pars.PickTune.YTune
		N107 def REAL parPickZ 			= gPickPlaceIf.Config.PickLoc.Z + gPickPlaceIf.Pars.PickTune.ZTune
	
		(Go to the pick location)
		N110 MoveAbsB parPickRadius X=parPickX Y=parPickY Z=parPickApproach F=parEmptyFeed 
		
		N150
		$IF !gPickPlaceIf.Status.ProductPresent	(Pick up the product)
			N111 MoveRelB parPickRadius Z=-parPickApproach G222 0 gPickPlaceIf.Status.ProductPresent = 1
			N112 G04 parPickDwell
			N113 MoveRelB 0 Z=parPickDepart F=parProductFeed
		$ELSE
			G04 0.0001
			G172
			$GOTO N150
		$ENDIF
		
		(Move to the place position)
		N201 def REAL parPlaceRadius 	= gPickPlaceIf.Pars.PlaceTune.Radius
		N202 def REAL parPlaceDwell 	= gPickPlaceIf.Pars.PlaceTune.DwellTime
		N203 def REAL parPlaceApproach 	= gPickPlaceIf.Config.PlaceLoc.Z + gPickPlaceIf.Pars.PlaceTune.ApproachHeight 
		N204 def REAL parPlaceDepart 	= gPickPlaceIf.Config.PlaceLoc.Z + gPickPlaceIf.Pars.PlaceTune.DepartHeight
		N205 def REAL parPlaceX 		= gPickPlaceIf.Config.PlaceLoc.X + gPickPlaceIf.Pars.PlaceTune.XTune
		N206 def REAL parPlaceY 		= gPickPlaceIf.Config.PlaceLoc.Y + gPickPlaceIf.Pars.PlaceTune.YTune
		N207 def REAL parPlaceZ 		= gPickPlaceIf.Config.PlaceLoc.Z + gPickPlaceIf.Pars.PlaceTune.ZTune
		
		(Head to the place position)
		N210 MoveAbsB parPlaceRadius x=parPlaceX Y=parPlaceY Z=parPlaceZ F=parProductFeed G222 0 gPickPlaceIf.Status.AtSync = 1
		
		(Wait for the command to be InSync)
		N211
		$IF gPickPlaceIf.Sync
			(At this point, do whatever the demo is, preform a place, make some movement w/e you want)
			(Start Demo sequence)
			N250 G02 I50 H720 Z50 G222 0 gPickPlaceIf.Status.ProductPresent = 0 (Do some helix movement)
			(End Demo Sequence)
			(When you're finished with the Demo, set this bit to break out of the synced movement)
			(Place this line on your last commanded movement G222 0 gPickPlaceIf.Status.ProductPresent = 0 )
			N301 gPickPlaceIf.Sync = 0
			N303 $GOTO N101
		$ELSE
			G04 0.005
			G172
			$GOTO N211
		$ENDIF
		

	$ELSE
		G04 0.005
		G172
	$ENDIF
$ENDWHILE
