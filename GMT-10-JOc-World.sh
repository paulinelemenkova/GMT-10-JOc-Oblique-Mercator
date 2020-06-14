#!/bin/sh

#  Created by Полина Леменкова on 5/10/19.
#
ps=GMT_JOc_World.ps

gmt psbasemap -R0/360/-70/70 -Joc0/0/90/30/0.064 -B30g30 -P -K > $ps

gmt pscoast -R -J -P \
    -Bpxg10f5a10 -Bpyg10f5a10 -Bsxg10 -Bsyg10 -B+t"Oblique Mercator" \
    -Gnavajowhite -Wthinnest \
    -Slightcyan \
    -TdjBR+w0.4i+l+o0.15i \
    -Lx5.6i/-0.7i+c50+w1000k+l"Scale, km"+f \
    -UBL/-15p/-45p -O >> $ps

gmt psconvert GMT_JOc_World.ps -A0.2c -E720 -Tj -Z
