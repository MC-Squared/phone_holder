require_relative 'params'

class EdgeCup < SolidRuby::Printed
  def initialize
  end

  def part(_show)
    res = cube($phone_d, $phone_d, $phone_d*1.75)
      .center_xy
      .fillet(r: $phone_d/4.0, left: [:top, :bottom], right: [:top, :bottom])

    res -= cube($phone_d, $phone_d + 1, $phone_d*1.25)
      .center_xy
      .fillet(r: $phone_d/4.0, left: [:top, :bottom])
      .translate(x: $phone_d/2.0, y: 0.1, z: $phone_d*0.25)

    #res += cube(4, $phone_d*1.25, 2)
      #.center_xy
    res -= ConnectorKey.new($phone_d*1.25, false)
      .translate(z: -0.01)

    if _show
      res
    else
      res.rotate(x: 90)
    end
  end
end
