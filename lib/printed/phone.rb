require_relative 'params'

class Phone < SolidRuby::Printed
  def initialize
  end

  def part(_show)
    cube($phone_w, $phone_h, $phone_d)
      .fillet(r: $phone_d, edges: :vertical)
  end
end
