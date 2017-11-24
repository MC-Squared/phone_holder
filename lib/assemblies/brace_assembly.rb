class BraceAssembly < SolidRuby::Assembly

  # Assemblies are used to show how different parts interact on your design.

  # Skip generation of the 'output' method for this assembly.
  # (will still generate 'show')

  def part(show)
    pin_y = -$phone_h/6.0
    pin_x = ($phone_w)/2.0 - $pin_d*1.25

    res = cylinder(d: $phone_w + $thickness*2.0 + 2, id: $phone_w - 1, h: $thickness)

    res -= cube(100, 100, 10)
      .translate(x: -105, y: -50, z: -1)

    res -= cube(100, 100, 10)
      .translate(x: -10, y: 0, z: -1)

    res += ConnectorKey.new($phone_d, true)
      .rotate(z: 80)
      .translate(x: -$phone_d/2.0 - 4, y: -$phone_w/2.0 - $key_w/4.0 + 0.5)

    res += ConnectorKey.new($phone_d, true)
      .translate(x: $phone_w/2.0 + $key_w/2.0,y: $phone_d/2.0)

    # pin pad
    res += cylinder(d: $pin_d*2, h: $thickness)
      .translate(x: pin_x, y: pin_y)

    # pin hole
    res -= cylinder(d: $pin_d + $tolerance, h: $thickness + 1)
      .translate(x: pin_x, y: pin_y, z: -0.5)

    if show
      res += EdgeCup.new.show
        .rotate(z: 180)
        .rotate(x: 180)
        .translate(x: $phone_w/2.0 + $thickness/2.0, y: $phone_d/2.0, z: $key_h)

      res += EdgeCup.new.show
        .rotate(x: 180, z: 80)
        .translate(x: -$phone_d, y: -$phone_w/2.0 - $thickness/2.0, z: $key_h)
    end

    res
  end
end
