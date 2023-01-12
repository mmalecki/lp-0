include <parameters.scad>;
use <rail-mount.scad>;
use <guide-node-stopper.scad>;
use <leg-addon.scad>;

slack = 1.05;

rail_mount();
translate([0, 0, slack * launch_pad_h]) {
  guide_node_stopper();
}

translate([(launch_pad_d / 2) * slack, 0, 0]) leg();
