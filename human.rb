class Human
  attr_reader :name, :health, :strength, :intellect, :location

  def initialize(stats)
    @name = stats[:name]
    @health = stats[:health]
    @strength = stats[:strength]
    @intellect = stats[:intellect]
    @location = 0
  end

  def run
    @location += 5
    puts "#{@name} wanders through the forest"
  end

  def says(words)
    puts words
  end
end
