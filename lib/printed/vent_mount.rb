require_relative 'params'

class VentMount < SolidRuby::Printed
  def initialize
  end

  def part(_show)
    res = cylinder(d: $vent_mount_d, h: $vent_mount_h)

    res += Pin.new.show
      .translate(z: $vent_mount_h - 0.01)

    # cut cylinder into one third
    res -= triangle(a: $vent_mount_d/2.0, alpha: 60, beta: 85)
      .translate(x: -$vent_mount_d/2.0)
      .linear_extrude(h: $vent_mount_h + $pin_h*2.0 + 1)
      .translate(z: -0.5)

    res -= triangle(a: $vent_mount_d/2.0, alpha: 60, beta: 90)
      .mirror(x: 1)
      .translate(x: $vent_mount_d/2.0)
      .linear_extrude(h: $vent_mount_h + $pin_h*2.0 + 1)
      .translate(z: -0.5)

    res -= cube($vent_mount_d + 2, $vent_mount_d, $vent_mount_h + $pin_h*2.0 + 1)
      .center_x
      .translate(y: -$vent_mount_d + 0.3, z: -0.5)

    res += cube($vent_mount_pin_h/2.0, $vent_mount_pin_h, $thickness)
      .center_x
      .fillet(r: 1, edges: :vertical)
      .translate(y: $thickness)

    res += cylinder(d: 1, h: $vent_mount_h + $pin_h + 1.5)
      .translate(x: 1.5, y: 0.45)

    res -= cylinder(d: 1 + $tolerance/2.0, h: 50 + $pin_h + 2.5)
      .translate(x: 1.5, y: 0.45, z: -0.5)
      .rotate(z: 120)

    if _show
      res
    else
      res.rotate(x: 90)
    end
  end
end
