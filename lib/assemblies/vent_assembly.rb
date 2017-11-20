class VentAssembly < SolidRuby::Assembly

  # Assemblies are used to show how different parts interact on your design.

  # Skip generation of the 'output' method for this assembly.
  # (will still generate 'show')
  skip :output

  def part(show)
    res = VentMount.new.show

    res += VentMount.new.show.rotate(z: 120)

    res += VentMount.new.show.rotate(z: -120)
  end
end
