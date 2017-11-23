class BraceAssembly < SolidRuby::Assembly

  # Assemblies are used to show how different parts interact on your design.

  # Skip generation of the 'output' method for this assembly.
  # (will still generate 'show')

  def part(show)
    res = ConnectorKey.new($phone_d, true)
      .translate(y: $phone_d/2.0)

    if show
      res += EdgeCup.new.show
        .rotate(x: 180)
        .translate(y: $phone_d/2.0, z: $key_h)

      res += EdgeCup.new.show
        .rotate(x: 180, z: 90)
        .translate(x: $phone_w/3.0 + $phone_d*0.2, y: -$phone_h/3.0, z: $key_h)
    end

    res += ConnectorKey.new($phone_d, true)
      .rotate(z: 90)
      .translate(x: $phone_w/3.0 + $phone_d*0.2, y: -$phone_h/3.0)

    res += cube($phone_d*0.6, $phone_h/10.0, $thickness)
      .center_x
      .translate(y: -$phone_h/10.0)

    res += cube(5.5, $phone_d*0.6, $thickness)
      .center_y
      .translate(x: $phone_w/4.3, y: -$phone_h/3.0)

    res += cube($phone_w/2.0, $phone_d*0.6, $thickness)
      .center_xy
      .rotate(z: -60)
      .translate(x: 12, y: -$phone_h/4.5) #.debug


    pin_y = -($phone_h/6.0)/2.0

    # pin pad
    res += cylinder(d: $pin_d*2, h: $thickness)
      .translate(y: pin_y)

    # pin hole
    res -= cylinder(d: $pin_d + $tolerance, h: $thickness + 1)
      .translate(y: pin_y, z: -0.5)

  end
end
