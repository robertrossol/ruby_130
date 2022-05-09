
class BeerSong
  def initialize
  end

  def self.lyrics
    verses(99, 0)
  end

  def self.verses(start_verse, end_verse)
    result = []
    (start_verse.downto(end_verse)).each do |num|
      result << verse(num)
    end
    result.join("\n")
  end

  def self.verse(num)
    if num == 0
      "#{bottle_config(num).capitalize} of beer on the wall, #{bottle_config(num)} of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    elsif num == 1
      "#{num.to_s + bottle_config(num)} of beer on the wall, #{num.to_s + bottle_config(num)} of beer.\n" \
      "Take it down and pass it around, #{bottle_config(num-1)} of beer on the wall.\n"
    else
      "#{num.to_s + bottle_config(num)} of beer on the wall, #{num.to_s + bottle_config(num)} of beer.\n" \
      "Take one down and pass it around, #{(num-1).to_s + bottle_config(num-1)} of beer on the wall.\n"
    end
  end

  class << self

    private

    def bottle_config(num)
      case num
      when 0
        "no more bottles"
      when 1
        " bottle"
      else
        " bottles"
      end
    end
  end
end

p BeerSong.verse(99)
p BeerSong.verses(99, 98)