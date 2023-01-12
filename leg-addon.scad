use <utils.scad>;
include <parameters.scad>;
use <nutsnbolts/cyl_head_bolt.scad>;

module leg () {
  difference () {
    union () {
      addon_face(leg_width, leg_mount_depth, launch_pad_h);

      translate([0, -leg_width / 2, 0]) {
        difference () {
          cube([leg_external_mount_depth, leg_external_mount_width, leg_external_mount_h]);

          translate([leg_external_mount_depth / 2, 0, leg_external_mount_h / 2])
            rotate([90, 90, 0])
              nutcatch_parallel("M3");
        }
      }

      translate([0, leg_width / 2 - leg_external_mount_width, 0]) {
        difference() {
          cube([leg_external_mount_depth, leg_external_mount_width, leg_external_mount_h]);

          translate([leg_external_mount_depth / 2, leg_external_mount_width, leg_external_mount_h / 2])
            rotate([90, 90, 0])
              mirror([0, 0, 1])
                nutcatch_parallel("M3");
        }
      }

      translate([0, -leg_external_mount_ridge_width / 2, 0]) {
        cube([leg_external_mount_depth, leg_external_mount_ridge_width, leg_external_mount_h]);
      }
    }

    translate([leg_external_mount_depth / 2, -leg_width / 2, leg_external_mount_h / 2])
      rotate([90, 0, 0])
        hole_through("M3");

    translate([0, 0, launch_pad_h - launch_pad_nutcatch_depth / 2]) {
      rotate([180, 270, 0]) {
        translate([0, 0, leg_external_mount_depth])
          hole_through("M8", h = leg_external_mount_depth);
      }
    }
  }

}

leg();

