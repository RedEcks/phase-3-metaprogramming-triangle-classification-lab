class Triangle
  # write code here
  attr_reader :side_one,:side_two,:side_three

  def initialize(side_one,side_two,side_three)
    @side_one = side_one
    @side_two = side_two
    @side_three = side_three
  end

  def kind
    validate_triangle
      if side_one==side_two && side_one==side_three
        :equilateral
      elsif side_one==side_two || side_one==side_three || side_two==side_three
        :isosceles
      else
        :scalene
      end
  end


  def no_sides?
    side_one>0 && side_two>0 && side_three>0
  end

  def triangle_inequality?
    side_one+side_two>side_three && side_one+side_three>side_two && side_two+side_three>side_one
  end

  def validate_triangle
    raise TriangleError unless no_sides? && triangle_inequality?
  end

  class TriangleError < StandardError

  end
end
