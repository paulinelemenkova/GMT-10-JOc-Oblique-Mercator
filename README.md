# GMT JOc Oblique Mercator — Oblique Mercator Projection Basemaps

GMT (Generic Mapping Tools) shell scripts producing coastline basemaps in the oblique Mercator projection. The projection axis is rotated to run along a chosen great-circle line, so that an elongated, obliquely trending feature such as an ocean trench or island arc can be mapped along its natural axis with minimal distortion. The scripts add graticules, scale bars and toponymy, and have been used as base and locator maps in the author's marine-geophysical and cartographic publications.

## What the scripts do

- draw filled coastlines in the oblique Mercator projection (pscoast -JOc lon/lat/azimuth/width) rotated along a great-circle / trench axis
- add graticule, frame, scale bar and directional rose (pscoast -B, -L, -Td)
- annotate seas, islands, peninsulas and trench-arc features with rotated toponymy labels (pstext)
- add the GMT logo (logo)
- export to raster (psconvert) at high resolution

A world-scale oblique Mercator overview is also included.

## Data source

Coastlines from GSHHG via GMT.

## File naming

Scripts follow GMT-10-...-JOc-XX.sh, where XX is an ocean-trench or region tag (e.g. KKT = Kuril-Kamchatka Trench, AT = Aleutian Trench, MT = Mariana Trench, NZ = New Zealand, World). A -GC suffix denotes a great-circle-aligned, fully annotated variant.

## Requirements

- GMT 6.x (Generic Mapping Tools): https://www.generic-mapping-tools.org
- A POSIX shell (bash/sh)
- The GSHHG shoreline dataset available via GMT

## Usage

Adjust the -R region and the -JOc projection parameters (centre and azimuth) at the top of the chosen script, then run:

    bash GMT-10-script-JOc-KKT-GC.sh

The script writes a PostScript file and converts it to a raster image (JPG/PNG) via psconvert.

## Author and citation

Polina Lemenkova
ORCID: https://orcid.org/0000-0002-5759-1089

These scripts support base and locator figures in the author's marine-geophysical and cartographic papers; please cite the specific article a given figure appears in. The full publication list is available via the ORCID record above.

## License

See the LICENSE file in this repository.
