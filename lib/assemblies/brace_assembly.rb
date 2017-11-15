class BraceAssembly < SolidRuby::Assembly

  # Assemblies are used to show how different parts interact on your design.

  # Skip generation of the 'output' method for this assembly.
  # (will still generate 'show')
  skip :output

  def part(show)
    res = EdgeCup.new.show
      .translate(y: $phone_d/2.0)
    res += ConnectorKey.new($phone_d, true)
      .translate(y: $phone_d/2.0)

    res += EdgeCup.new.show
      .rotate(z: 90)
      .translate(x: $phone_w/3.0 + $phone_d*0.2, y: -$phone_h/3.0)

    res += ConnectorKey.new($phone_d, true)
      .rotate(z: 90)
      .translate(x: $phone_w/3.0 + $phone_d*0.2, y: -$phone_h/3.0)

    res += cube($phone_d*0.6, $phone_h/3.0, 2)
      .center_x
      .translate(y: -$phone_h/3.0)

    res += cube($phone_w/3.0, $phone_d*0.6, 2)
      .center_y
      .translate(x: -($phone_d*0.6)/2.0, y: -$phone_h/3.0)

    res += cylinder(d: $pin_size*2, h: 2)
      .translate(y: -$phone_h/6.0)

    res -= cylinder(d: $pin_size + $tolerance, h: 2.5)
      .translate(y: -$phone_h/6.0, z: -0.25)
      #.center_y
      #.translate(x: -($phone_d*0.6)/2.0, y: -$phone_h/3.0)

    res += cube($phone_w/3.0, $phone_d*0.6, 2)
      .center_xy
      .rotate(z: -45)
      .translate(x: $phone_d, y: -$phone_h/3.75)
  end
end
