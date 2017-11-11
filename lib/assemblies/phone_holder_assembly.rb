class PhoneHolderAssembly < SolidRuby::Assembly

  # Assemblies are used to show how different parts interact on your design.

  # Skip generation of the 'output' method for this assembly.
  # (will still generate 'show')
  skip :output

  def part(show)
    res = Phone.new.debug.translate(z: 3)

    res += BraceAssembly.new
      .translate(x: -5, y: $phone_h*0.275)

    res += BraceAssembly.new
      .mirror(x: 1)
      .translate(x: $phone_w + 5, y: $phone_h*0.275)

    res += Wishbone.new
      .rotate(z: 180)
      .translate(x: $phone_w/2.0, y: $phone_h/2.5, z: -10)
  end
end
