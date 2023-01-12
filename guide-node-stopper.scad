include <parameters.scad>;

module guide_node_stopper () {
  linear_extrude (launch_pad_stopper_h) {
    difference () {
      circle(d = launch_pad_rod_d + launch_pad_stopper_thickness);
      circle(d = launch_pad_rod_d);
    }
  }
}

guide_node_stopper();
