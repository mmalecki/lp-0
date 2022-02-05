use <nutsnbolts/cyl_head_bolt.scad>;
include <parameters.scad>;

module rod_nutcatch () {
  translate([launch_pad_nutcatch_offset, 0, launch_pad_h - launch_pad_nutcatch_depth / 2]) {
    rotate([0, 270, 0]) {
      nutcatch_sidecut("M8");
      translate([0, 0, launch_pad_d / 4]) hole_through("M8");
    }
  }
}

difference () {
  union () {
    linear_extrude (launch_pad_h) {
      difference () {
        circle(d = launch_pad_d);
        circle(d = launch_pad_rod_d);
      }
    }

    translate([0, 0, launch_pad_h]) {
      linear_extrude (launch_pad_stopper_h) {
        difference () {
          circle(d = launch_pad_rod_d + launch_pad_stopper_thickness);
          circle(d = launch_pad_rod_d);
        }
      }
    }
  }

  rod_nutcatch();
  rotate([0, 0, 90]) rod_nutcatch();
  rotate([0, 0, 180]) rod_nutcatch();

  rotate([0, 0, 270]) {
    translate([launch_pad_d / 2 - launch_pad_recess_depth, -launch_pad_recess_width / 2, launch_pad_h - launch_pad_recess_h]) {
      cube([launch_pad_recess_width, launch_pad_recess_depth, launch_pad_recess_h]);
    }

    translate([(launch_pad_d - launch_pad_recess_depth) / 2, 0, 0]) {
      translate([0, 0, launch_pad_h]) hole_through("M8");
      translate([0, 0, launch_pad_recess_nutcatch_offset]) nutcatch_sidecut("M8");
    }
  }
}
