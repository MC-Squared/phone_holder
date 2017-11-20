class PhoneHolderAssembly < SolidRuby::Assembly

  # Assemblies are used to show how different parts interact on your design.

  # Skip generation of the 'output' method for this assembly.
  # (will still generate 'show')
  skip :output

  def part(show)
    res = Phone.new
      .rotate(x: 90)
      .translate(z: 5)

    res += BraceAssembly.new.show
      .rotate(x: 90)
      .translate(x: -5, y: 3, z: $phone_h/3.0)

    res += BraceAssembly.new.show
      .rotate(x: 90)
      .mirror(x: 1)
      .translate(x: $phone_w + 5, y: 3, z: $phone_h/3.0)

    res += Wishbone.new
      .rotate(z: 180)
      .rotate(x: 90)
      .translate(x: $phone_w/2.0, y: 8, z: $phone_h/2.0 - 5)
  end
end
