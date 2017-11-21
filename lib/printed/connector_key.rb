require_relative 'params'

class ConnectorKey < SolidRuby::Printed
  def initialize(l=1, inner=true)
    @length = l
    @inner = inner
  end

  def part(_show)
    h = $key_h

    h += $tolerance*0.5 unless @inner
    res = cube($key_w, @length, h)
      .center_xy

    res -= cube($key_w, @length + 5, $key_w)
      .center_y
      .translate(x: 0.5)
      .rotate(y: 45)

    res -= cube($key_w, @length + 5, $key_w)
      .center_y
      .translate(x: 0.5)
      .rotate(y: 45)
      .mirror(x: 1)

    res.rotate(x: 180)
      .translate(z: h)
  end
end
