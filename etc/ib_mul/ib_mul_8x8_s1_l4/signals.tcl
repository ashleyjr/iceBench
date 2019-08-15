set sigs [list]

lappend sigs "i_clk"
lappend sigs "i_nrst"
lappend sigs "i_start"
lappend sigs "o_done"
lappend sigs "i_a"
lappend sigs "i_b"
lappend sigs "o_c"

set added [ gtkwave::addSignalsFromList $sigs ]
gtkwave::/Time/Zoom/Zoom_Full
