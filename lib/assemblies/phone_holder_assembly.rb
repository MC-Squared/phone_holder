class PhoneHolderAssembly < SolidRuby::Assembly

  # Assemblies are used to show how different parts interact on your design.

  # Skip generation of the 'output' method for this assembly.
  # (will still generate 'show')
  skip :output

  def part(show)
    res = Phone.new
      .rotate(x: 90)
      .translate(y: 32, z: 5)

    res += BraceAssembly.new.show
      .rotate(x: 90)
      .translate(x: -5, y: 20, z: $phone_h/3.0)

    res += BraceAssembly.new.show
      .rotate(x: 90)
      .mirror(x: 1)
      .translate(x: $phone_w + 5, y: 20, z: $phone_h/3.0)

    res += Wishbone.new
      .rotate(x: -90)
      .translate(x: $phone_w/2.0, y: 10, z: $phone_h/1.75)

    res += VentMount.new.show
      .rotate(z: 180)
      .translate(x: $phone_w/2.0, y: 0, z: $phone_h/1.75)

    res += VentMount.new.lock_tab
      .rotate(x: 90, y: 90)
      .translate(x: $phone_w/2.0, y: -$vent_mount_h + $pin_d, z: $phone_h/1.75 + $pin_d/2.0)

  end
end
