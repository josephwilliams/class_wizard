class Warrior < Human
  def initialize(stats, items)
    super(@name, @faction, @health, @strength, @intellect)
    @weapon = items[:weapon]
    @armor = items[:armor]
  end

  def charge(enemy)
    damage = rand(5)
    puts "#{@name} charges #{enemy.name}, causing #{damage} damage."
  end

end
