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

		(Wait for the command to be InSync)
		N211
		$IF gPickPlaceIf.Sync
			(At this point, do whatever the demo is, preform a place, make some movement w/e you want)
			(Start Demo sequence)
			G91
			N250 G01 Z-35 F=parProductFeed
			N251 G04 0.300
			N252 G01 Z35 G222 0 gPickPlaceIf.Sync = 0
			G90
			(End Demo Sequence)
			(When you're finished with the Demo, set this bit to break out of the synced movement)
			(Place this line on your last commanded movement G222 0 gPickPlaceIf.Status.ProductPresent = 0 )
			N301 gPickPlaceIf.Sync = 0
			N303 $GOTO N211
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
