#!/bin/sh
# Purpose: coastline basemap in Mercator oblique projection (here: Kuril-Kamchatka Trench)
# GMT modules: pscoast, pstext, psconvert
# Step-1. Generate a file
ps=GMT_JOc_KKT.ps
# Step-2. GMT set up
gmt set FORMAT_GEO_MAP=dddF \
    MAP_FRAME_PEN=dimgray \
    MAP_FRAME_WIDTH=0.1c \
    MAP_TITLE_OFFSET=0.5c \
    MAP_ANNOT_OFFSET=0.3c \
    MAP_TICK_PEN_PRIMARY=thin,dimgray \
    MAP_GRID_PEN_PRIMARY=thinnest,dimgray \
    FONT_TITLE=12p,Palatino-Roman,black \
    FONT_ANNOT_PRIMARY=7p,Palatino-Roman,dimgray \
    FONT_LABEL=7p,Palatino-Roman,dimgray \
# Step-3. Overwrite defaults of GMT
gmtdefaults -D > .gmtdefaults
# Step-4. Add coastline
gmt pscoast -R140/38/170/60r -JOc155/50/155/210/6i -P \
    -Bpxg4f1a4 -Bpyg2f1a2 -Df -B+t"Coastline and major toponymy of the Kuril-Kamchatka area" \
    -Gnavajowhite -Wthinnest \
    -Slightcyan \
    -TdjBR+w0.4i+l+o0.15i \
    -Lx5.6i/-0.7i+c100+w1000k+l"Scale, km"+f \
    -UBL/-15p/-45p -K > $ps
# Step-7. Add texts
gmt pstext -R -J -N -O -K \
    -F+jTL+f12p,Times-Roman,blue+jLB >> $ps << EOF
146.0 51.5 Sea of Okhotsk
EOF
gmt pstext -R -J -N -O -K \
    -F+jTL+f11p,Times-Roman,black+jLB+a-280 >> $ps << EOF
158.0 53.0 Kamchatka Peninsula
EOF
gmt pstext -R -J -N -O -K \
    -F+jTL+f10p,Times-Roman,black+jLB+a-298 >> $ps << EOF
143.0 49.0 Sakhalin Island
EOF
gmt pstext -R -J -N -O -K \
    -F+jTL+f9p,Times-Roman,black+jRB+a-5 >> $ps << EOF
140.2 39.3 Honshu
141.7 43.0 Hokkaido
146.5 44.7 Kunashir
149.3 45.1 Iturup
151.1 45.7 Urup
EOF
gmt pstext -R -J -N -O -K \
    -F+jTL+f12p,Times-Roman,blue+jLB >> $ps << EOF
156.0 48.0 Pacific Ocean
136.0 40.0 Sea of Japan
EOF
gmt pstext -R -J -N -O -K \
    -F+jTL+f10p,Times-Roman,black+jLB+a-350 >> $ps << EOF
147.5 45.5 G r e a t e r
EOF
gmt pstext -R -J -N -O -K \
    -F+jTL+f10p,Times-Roman,black+jLB+a-315 >> $ps << EOF
151.5 47.2 K u r i l
EOF
gmt pstext -R -J -N -O -K \
    -F+jTL+f10p,Times-Roman,black+jLB+a-300 >> $ps << EOF
153.5 49.0 C h a i n
EOF
gmt pstext -R -J -N -O -K \
    -F+jTL+f10p,Times-Roman,blue+jLB >> $ps << EOF
136.5 50.2 A m u r
EOF
# Step-11. Add GMT logo
gmt logo -Dx6.2/-2.2+o0.1i/0.1i+w2c -O >> $ps
# Step-6. Convert to image file using GhostScript (portrait orientation, 720 dpi)
gmt psconvert GMT_JOc_KKT.ps -A0.5c -E720 -Tj -Z
