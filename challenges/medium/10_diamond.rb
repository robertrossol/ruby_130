
class Diamond

  ALPHABET = "abcdefghijklmnopqrstuvwxyz".upcase
  def self.make_diamond(max_letter)
    @max_letter = max_letter
    diamond = []
    (('A'..max_letter).to_a + ('A'...max_letter).to_a.reverse).each do |letter|
      diamond << line(letter)
    end
    diamond.join("\n") + "\n"
  end

  class << self

    private

    def line(letter)
      if letter == "A"
        "A".center(width)
      else
        # space_outside(letter) + letter + spacing_between(letter) + letter + space_outside(letter)
        (letter + ' ' * spacing_between(letter) + letter).center(width)
      end
    end

    def width
      return 1 if @max_letter == "A"
      ALPHABET.index(@max_letter) * 2 + 1
    end

    def spacing_between(line_letter)
      (ALPHABET.index(line_letter) * 2 - 1)
    end

    # def space_outside(line_letter)
    #   " " * ((width - spacing_between(line_letter).size - 2) / 2)
    # end
  end
end

puts Diamond.make_diamond("A")
puts Diamond.make_diamond("D")
puts Diamond.make_diamond("F")