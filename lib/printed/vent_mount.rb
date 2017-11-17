require_relative 'params'

class VentMount < SolidRuby::Printed
  def initialize
  end

  def part(_show)
    res = cylinder(d: $pin_d, h: 50)

    # cut cylinder into one third
    res -= triangle(a: $pin_d/2.0, alpha: 60, beta: 90)
      .translate(x: -$pin_d/2.0)
      .linear_extrude(h: 50 + 1)
      .translate(z: -0.5)

    res -= triangle(a: $pin_d/2.0, alpha: 60, beta: 90)
      .mirror(x: 1)
      .translate(x: $pin_d/2.0)
      .linear_extrude(h: 50 + 1)
      .translate(z: -0.5)

    res -= cube($pin_d, $pin_d, 51)
      .center_x
      .translate(y: -$pin_d + 0.01, z: -0.5)

  end
end
