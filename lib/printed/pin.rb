require_relative 'params'

class Pin < SolidRuby::Printed
  def initialize
  end

  def part(_show)
    res = cylinder(d: $pin_d, h: $pin_h)

    res += cylinder(d1: $pin_d, d2: $pin_d + 0.5, h: 0.5)
      .translate(z: $pin_h - 0.01)

    res += cylinder(d1: $pin_d + 0.5, d2: $pin_d, h: 1)
      .translate(z: $pin_h + 0.5 - 0.02)

    res -= cube($pin_d + 1, $pin_gap, $pin_h *2)
      .center_xy
      .translate(z: -0.5)
  end
end
