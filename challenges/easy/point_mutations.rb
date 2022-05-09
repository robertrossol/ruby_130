
class DNA
  attr_reader :strand
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(comp_strand)
    # length = strand.size <= comp_strand.size ? strand.size : comp_strand.size
    length = [strand.size, comp_strand.size].min
    # differences = 0
    # # 0.upto(length - 1) do |idx|
    # length.times do |idx|
    #   differences += 1 unless strand[idx] == comp_strand[idx]
    # end
    # differences
    (0...length).count{ |idx| strand[idx] != comp_strand[idx] }
  end
end

x = DNA.new('GGACGGATTCTGACCTGGACTAATTTTGGGG')
puts x.hamming_distance('AGGACGGATTCTGACCTGGACTAATTTTGGGG')