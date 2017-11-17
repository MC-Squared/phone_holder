require_relative 'params'

class Wishbone < SolidRuby::Printed
  def initialize
  end

  def part(_show)
    t = triangle(beta: 90, alpha: 45, b: $phone_w + $phone_d)
      .rotate(z: 45)

    # pads

    res = cylinder(d: $pin_d*2, h: 2)

    res += cylinder(d: $pin_d*2, h: 2)
      .translate(x: -t.a)
      .rotate(z: -45)

    res += cylinder(d: $pin_d*2, h: 2)
      .translate(x: t.c)
      .rotate(z: 45)

    # pins
    res += Pin.new.show
       .translate(x: -t.a)
       .rotate(z: -45)

    res += Pin.new.show
      .translate(x: t.c)
      .rotate(z: 45)

    # sides
    res += cube(x: t.a, y: $pin_d*1.0, z: 2)
      .center_y
      .rotate(z: -t.gamma + 180)

    res += cube(x: t.c, y: $pin_d*1.0, z: 2)
      .center_y
      .rotate(z: t.alpha)

    th = triangle(beta: 90, a: t.a, c: t.b/2.0)

    res += cube(x: t.b, y: $pin_d*1.0, z: 2)
      .center_xy
      .translate(y: th.c)

    # main pivot
    res -= cylinder(d: $pin_d + $tolerance, h: 5)
      .translate(z: -1)
      .rotate(z: 45)

    res
  end
end
