require_relative 'params'

class ConnectorKey < SolidRuby::Printed
  def initialize(l=1, inner=true)
    @length = l
    @inner = inner
  end

  def part(_show)
    h = 2
    h += $tolerance*0.5 unless @inner
    res = cube(4, @length, h)
      .center_xy

    res -= cube(4, @length + 5, 4)
      .center_y
      .translate(x: 0.5)
      .rotate(y: 45)

    res -= cube(4, @length + 5, 4)
      .center_y
      .translate(x: 0.5)
      .rotate(y: 45)
      .mirror(x: 1)
  end
end
