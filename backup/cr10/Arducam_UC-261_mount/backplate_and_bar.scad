use <backplate.scad>
use <mounting_bar.scad>
include <config.scad>

backplate();
translate([-1 * channel_padding, -1 * channel_padding, 7]) {
    mounting_bar();
}
