use <nutsnbolts/cyl_head_bolt.scad>;
include <parameters.scad>;

function addon_face_inset (width) = (width / 2);

fit_launch_pad_recess_depth = launch_pad_recess_depth * (1 / fit);
fit_launch_pad_recess_width = launch_pad_recess_width * (1 / fit);
fit_launch_pad_recess_h = launch_pad_recess_h * (1 / fit);

module recessed_addon_mount () {
  translate([-fit_launch_pad_recess_depth, -fit_launch_pad_recess_width / 2, launch_pad_h - launch_pad_recess_h])
    difference () {
      cube([fit_launch_pad_recess_depth, fit_launch_pad_recess_width, launch_pad_recess_h]);
      translate([
        fit_launch_pad_recess_depth / 2,
        fit_launch_pad_recess_width / 2,
        launch_pad_recess_h
      ])
        hole_through("M8");
    }
}

module addon_face (width, depth, height) {
  inset = addon_face_inset(width);

  linear_extrude(height)
    translate([-launch_pad_d / 2 - depth, 0])
      difference () {
        translate([launch_pad_d / 2 - inset, -width / 2]) square([inset + depth, width ]);
        circle(d = launch_pad_d);
      }

}

module rod_addon_face (width, depth, height) {
  difference () {
    addon_face(width, depth, height);

    translate([0, 0, height - launch_pad_nutcatch_depth / 2]) {
      rotate([0, 270, 0]) {
        translate([0, 0, launch_pad_d / 4]) hole_through("M8");
      }
    }
  }

}

addon_face(launch_pad_d, 1);
