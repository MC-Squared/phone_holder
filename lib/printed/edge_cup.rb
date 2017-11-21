require_relative 'params'

class EdgeCup < SolidRuby::Printed
  def initialize
  end

  def part(_show)
    res = cube($phone_d, $phone_d, $phone_d*2)
      .center_xy
      .fillet(r: $phone_d/4.0, left: [:top, :bottom], right: [:top, :bottom])

    res -= cube($phone_d, $phone_d + 1, $phone_d)
      .center_xy
      .fillet(r: $phone_d/4.0, left: [:top, :bottom], right: [:top, :bottom])
      .rotate(y: 45)
      .translate(x: 1, y: 0.1, z: $phone_d/1.5)

    res -= ConnectorKey.new($phone_d*1.25, false)
      .rotate(x: 180)
      .translate(z: $key_h)

    if _show
      res
    else
      res.rotate(x: 90)
    end
  end
end
