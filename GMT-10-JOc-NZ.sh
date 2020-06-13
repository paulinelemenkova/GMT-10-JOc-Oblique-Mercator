ps=GMT_obl_merc_.ps
gmt pscoast -R145/-62/186/-30r -JOc165/-29.5/-100/85/3i \
-Bpxg4f2a4 -Bpyg4f2a4 -Bsxg4 -Bsyg2 -Di -A250 \
    -Gburlywood -Wthinnest -P -TdjBR+w0.4i+f2+l+o0.15i \
    -Sazure --FONT_TITLE=8p --MAP_TITLE_OFFSET=0.05i -K > ps
# Add shorelines
gmt grdcontour hpt_relief.nc -R -J -C1000 -A2000 -W0.1p -O -K >> $ps
