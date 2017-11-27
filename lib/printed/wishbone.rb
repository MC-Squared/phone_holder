require_relative 'params'

class Wishbone < SolidRuby::Printed
  def initialize
  end

  def part(_show)
    t = triangle(beta: 90, alpha: 45, b: $phone_w + $phone_d)
      .rotate(z: 45)

    res = cylinder(
      d: $phone_w + $thickness*2.0 + $pin_d,
      id: $phone_w,
      h: $thickness)
      .translate(y: $phone_w/2.0 + $thickness)

    res -= cube($phone_w*2, $phone_w, $thickness + 1)
      .center_x
      .translate(y: $phone_w/2.0, z: -0.5)

    # pads
    res += cylinder(d: $pin_d*2, h: $thickness)

    res += cylinder(d: $pin_d*2, h: $thickness)
      .translate(x: -t.a)
      .rotate(z: -45)

    res += cylinder(d: $pin_d*2, h: $thickness)
      .translate(x: t.c)
      .rotate(z: 45)

    # pins
    res += Pin.new.show
       .translate(x: -t.a, z: $thickness - 0.01)
       .rotate(z: -45)

    res += Pin.new.show
      .translate(x: t.c, z: $thickness - 0.01)
      .rotate(z: 45)

    # main pivot
    res -= cylinder(d: $pin_d + $tolerance, h: $thickness+2)
      .translate(z: -1)
      .rotate(z: 45)

    res
  end
end
