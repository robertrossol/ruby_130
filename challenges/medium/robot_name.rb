class Robot
  @@used_names = []

  def name
    return @name if @name
    @name = generate_name while @@used_names.include?(@name) || @name.nil?
    # if @name.nil?
    #   loop do
    #     temp_name = generate_name
    #     break @name = temp_name if !@@used_names.include?(temp_name)
    #   end
    #   @@used_names << @name
    # end
    @@used_names << @name
    @name
  end

  def self.used_names
    @@used_names
  end

  def generate_name
    name = ""
    2.times { name << rand(65..90).chr } #use ASCII codes for letters
    # 2.times { name << ('A'..'Z').to_a.sample }
    # 2.times { name += LETTERS.sample }
    3.times { name << rand(0..9).to_s }
    # 3.times { name += DIGITS.sample.to_s }
    name
  end

  def reset
    @@used_names.delete(@name)
    @name = nil
  end
  
end
Kernel.srand(1000)
x = Robot.new
Kernel.srand(1000)
y = Robot.new
p x.name
p y.name
p Robot.used_names
x.reset
p x.name
p Robot.used_names