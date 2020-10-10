# half_lap_templates

A set of templates for marking half-lap joints on dimensional lumber, along with blocks for setting depth stops on saws and routers.

**Files are currently configured for US 2x4" nominal lumber**, but all of the SCAD files are parametric, so it should be possible to adjust them for other size boards via [config.scad](config.scad).

## Included Models

[half-lap_wide-wide_end.scad](half-lap_wide-wide_end.scad) - Template for marking half-lap cuts on the wide face on the end of a board. Has two slots, one for lapping boards wide-face to wide-face, and one for lapping wide-face to end.

[![half-lap_wide-wide_end](half-lap_wide-wide_end.png)](half-lap_wide-wide_end.png)

## Printing

The models themselves are all in inches. 3D printers work in mm. To account for this, each model is wrapped in the ``as_mm()`` function, which comes from [modules/as_mm.scad](modules/as_mm.scad), and takes a single ``convert_to_mm`` boolean parameter. Normally, this parameter is false, and you see the model in inches. When the model is converted to an STL file for printing, ``convert_to_mm`` is overridden to be ``true``, so the STL file is scaled to mm.
