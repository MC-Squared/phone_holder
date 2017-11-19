require_relative 'params'

class VentMount < SolidRuby::Printed
  def initialize
  end

  def part(_show)
    res = cylinder(d: $pin_d, h: 50)

    res += Pin.new.show
      .translate(z: 50)

    # cut cylinder into one third
    res -= triangle(a: $pin_d, alpha: 60, beta: 90)
      .translate(x: -$pin_d)
      .linear_extrude(h: 50 + $pin_h*2.0 + 1)
      .translate(z: -0.5)

    res -= triangle(a: $pin_d, alpha: 60, beta: 90)
      .mirror(x: 1)
      .translate(x: $pin_d)
      .linear_extrude(h: 50 + $pin_h*2.0 + 1)
      .translate(z: -0.5)

    res -= cube($pin_d + 2, $pin_d, 50 + $pin_h*2.0 + 1)
      .center_x
      .translate(y: -$pin_d + 0.01, z: -0.5)

    res += cube($pin_d/2.0, $pin_d, 2)
      .center_x
      .fillet(r: 1, edges: :vertical)
      .translate(y: 1)

    res += cylinder(d: 1, h: 50 + $pin_h + 1.5)
      .translate(x: 1.5, y: 0.5)

    res -= cylinder(d: 1 + $tolerance/2.0, h: 50 + $pin_h + 2.5)
      .translate(x: 1.5, y: 0.5, z: -0.5)
      .rotate(z: 120)

    res
  end
end
