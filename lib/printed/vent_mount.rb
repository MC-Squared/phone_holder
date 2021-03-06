require_relative 'params'

class VentMount < SolidRuby::Printed
  def initialize
  end

  def part(_show)
    res = Pin.new.show
      .rotate(z: 90)
      .rotate(x: 90)

    res.translate(z: $pin_d/2.0 - 1)

  if _show
    res += cylinder(d: $pin_d + 1.5,
      h: $vent_mount_h)
      .rotate(x: 90)
      .translate(y: $vent_mount_h, z: $pin_d/2.0 - 1)
  else
    res += PrintedThread.new(
      diameter: $pin_d + 1.5,
      length: $vent_mount_h).show
      .rotate(x: 90)
      .translate(y: $vent_mount_h, z: $pin_d/2.0 - 1)
  end

    res -= cube($pin_d, $vent_mount_h + $pin_h*2.0, 10)
      .center_x
      .translate(y: -$pin_h*1.5, z: -10)

    res += cube($vent_mount_plate_w, $thickness, $pin_d)
      .center_x
      .fillet(r: 2, edges: :vertical)
      .translate(y: $vent_mount_h - 0.1)

    res += lock_tab
      .rotate(z: 90)
      .rotate(x: -90)
      .translate(y: 45,  z: $pin_d/2.0 - $tolerance/2.0)

    #lock_tab
    #lock_nut(_show)
  end

  view :lock_tab
  view :lock_nut

  def lock_tab
    res = cube($vent_mount_plate_w, $pin_d + $thickness, $pin_d + $thickness)
      .center_xy
      .fillet(r: 2, edges: :vertical)

    res -= cube($pin_d + $tolerance*2.0, $pin_d + $thickness+1, ($pin_d + $thickness)/2.0)
      .center_xy
      .translate(x: -$tolerance/2.0, z: ($pin_d + $thickness)/2.0 + 0.01)

    res -= cylinder(d: $pin_d + 2.5, h: $pin_d + $thickness + 1)
      .translate(z: -0.1)

    res -= cube($pin_d + $thickness, $pin_d + $thickness + 1, ($pin_d + $thickness)/2.0)
      .center_xy
      .translate(x: $vent_mount_plate_w/2.0 - $thickness/2.0, z: -0.1)

    res -= cube($pin_d + $thickness, $pin_d + $thickness + 1, ($pin_d + $thickness)/2.0)
      .center_xy
      .translate(x: -$vent_mount_plate_w/2.0 + $thickness/2.0, z: -0.1)
  end

  def lock_nut(_show=true)
    res = cylinder(d: $vent_nut_d, h: $thickness, fn: 8)

    if _show
      res -= cylinder(d: $pin_d + 1.5,
        h: $thickness+1)
        .translate(z: -0.5)
    else
      res -= PrintedThread.new(
        diameter: $pin_d + 1.5,
        inner: true,
        length: $vent_mount_h).show
        .translate(z: -0.5)
    end

    res
  end
end
