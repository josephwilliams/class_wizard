class Dragon
  attr_reader :name
  attr_accessor :distracted, :health

  def initialize(stats)
    @name = stats[:name]
    @health = stats[:health]
    @distracted = true

    puts "#{@name} lets out a smokey belch"
  end

  def breathe_fire(enemy)
    unless @distracted
      puts "#{@name} breathes fire at #{enemy.name}!"
      enemy.health -= 3
    else
      puts "#{@name} is distracted!"
    end
  end
end
