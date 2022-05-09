# Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

# An equilateral triangle has all three sides the same length.

# An isosceles triangle has exactly two sides of the same length.

# A scalene triangle has all sides of different lengths.

# Note: For a shape to be a triangle at all, all sides must be of length > 0, and the sum of the lengths of any two sides must be greater than the length of the third side.

# Problem: Take a triangle object and determine which of the three types of triangle it is.
  # - Step 1: Define Triangle/Create Traingle class
  # - Step 2: Define/Create methods to determine side length validity
  
class Triangle
  attr_reader :sides
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    # raise ArgumentError, "No side can be 0" if [side1, side2, side3].include?(0)
    # raise ArgumentError, "Invalid Side Lengths" unless ((side1 + side2 > side3) && (side2 + side3 > side1) && (side1 + side3 > side2))
    # raise StandardError, "Invalid Side Lengths" if [side1 + side2, side2 + side3, side1 + side3].min < [side1, side2, side3].max
    raise ArgumentError, "Invalid Side Lengths" unless valid?
  end

  def valid?
    sides.min > 0 &&
      sides[0] + sides[1] > sides[2] &&
      sides[1] + sides[2] > sides[0] &&
      sides[0] + sides[2] > sides[1]
  end

  def kind
    case sides.uniq.size
    when 1
      return "equilateral" 
    when 2
      return "isosceles"
    when 3
      return "scalene"
    end
  end


end

p Triangle.new(4,4,4).kind
p Triangle.new(4,3,4).kind
p Triangle.new(2,3,4).kind