class Human
  attr_reader :name, :faction, :health, :strength, :intellect

  def initialize(stats)
    @name = stats[:name]
    @faction = stats[:faction]
    @health = stats[:health]
    @strength = stats[:strength]
    @intellect = stats[:intellect]
  end

  def run
    distance = rand(5)
    puts "#{@name} wanders #{distance} paces through the forest"
  end

  def travel
    realms.sample
  end
end
