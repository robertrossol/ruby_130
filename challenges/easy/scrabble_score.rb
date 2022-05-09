
class Scrabble
  attr_reader :word
  
  VALUES = {
    0 => [' ', nil],
    1 => %w(A E I O U L N R S T),
    2 => %w(D G),
    3 => %w(B C M P),
    4 => %w(F H V W Y),
    5 => %w(K),
    8 => %w(J X),
    10 => %w(Q Z)
  }

  POINTS = {
    'AEIOULNRST' => 1,
    'DG' => 2,
    'BCMP' => 3,
    'FHVWY' => 4,
    'K' => 5,
    'JX' => 8,
    'QZ' => 10
  }

  def initialize(word)
    @word = word || ''
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def score
    letters = word.upcase.gsub(/[^A-Z]/, '').chars
    p letters
    # score = 0
    letters.each_with_object([0]) do |letter, score|
      POINTS.each do |key, val|
        score << val if key.include?(letter)
      end
    end.reduce(:+)
    # score
  end

  # def score(word = @word)
  #   return 0 if word.nil?
  #   letters = word.upcase.gsub(/[^A-Z]/, '').chars
  #   # score = 0
  #   letters.each_with_object([0]) do |letter, score|
  #     # p score
  #     x = VALUES.keys.select do |val|
  #       # VALUES[val].include?(letter)
  #       VALUES[val].include?(letter)
  #     end.first
  #     score << x
  #   end.reduce(:+)
  # end
end

x = Scrabble.new("H i ")
p x
p x.score

p Scrabble.score("Hello")

p Scrabble.new(" \t\n")