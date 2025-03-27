##############################
proc dist_from {sp} {set ep [ga [gtpf $sp] endpoint] ; suppress_message UIC-058 ; suppress_message TIM-011 ; suppress_message TIM-010
if {[ga $ep object_class] == "port"} {set x1 [lx [lx [ga [ga $ep bbox] 0] 0] ; set y1 [lx [lx [ga [ga $ep bbox] 0] 1]
} else {                              set x2 [lx [ga [gfco $ep] origin] 0]   ; set y2 [lx [ga [gfco $ep] origin] 1]}
if {[ga $sp object_class] == "port"} {set x1 [lx [lx [ga $sp bbox] 0] 0]     ; set y1 [lx [lx [ga $sp bbox] 0] 1]
} else {                              set x2 [lx [ga [gfco $sp] origin] 0]   ; set y2 [lx [ga [gfco $sp] origin] 1]} ; e "[x ((abs($x2 - $x1)) + (abs($y2 - $y1)))] ; $ep"}
##############################
proc reg_fanout {pin } {[dsa ; gui_change_highlight -add -collection [all_fanout -from [ga $pin full_name] -flat -endpoints_only -only_cells ]]}
##############################
proc lvt_swap {ep} {fic m [gfco [ga [gtpt $ep] points.object] -f "ref_name =~ *SVT*BUF* || ref_name =~ *SVT*INV*"] {e "size_cell [gon $m] [string map {{SVT} "LVT"} [ga $m ref_name]] ; sa -o \[gfc [gon $m]\] -n dont_touch -v true ; sfo \[gfc [gon $m]\]"}}
##############################
proc lvt_swp {pt} {fic m [gfco $pt] {v "size_cell [gon $m] [string map {{SVT} "LVT"} [ga $m ref_name]]"}}
##############################
proc ult_swp {pt} {fic m [gfco $pt] {v "size_cell [gon $m] [string map {{LVT} "ULT"} [ga $m ref_name]]"}}
