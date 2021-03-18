
def plc_global path_synch RobotPickPlaceTyp gPickPlaceIf

(Wait until a flag is true?)
N050 $WHILE gPickPlaceIf.Status.ProductOK == 0
N051	G04 0.001
N052	G172
N053 $ENDWHILE

N999 M30
