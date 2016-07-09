class Dragon
  attr_reader :name
  attr_accessor :distracted

  def initialize(stats)
    @name = stats[:name]
    @health = stats[:health]
    @distracted = true

    puts "#{@name} lets out a smokey belch"
  end

  def breath_fire(enemy)
    unless @distracted
      enemy.health -= 3
    else
      "#{@name} is distracted!"
    end
  end
end
