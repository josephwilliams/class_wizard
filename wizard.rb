require_relative 'human'
require_relative 'ancient_tome'

class Wizard < Human
  include Ancient_Tome

  def speak(words)
    super + " wisely"
  end

  def read(book)
    "#{@name} reads #{book}"
  end

  def learn
    @intellect += 1
  end

  def cast_spell(enemy)
    puts "Pixel casts a spell!"
    enemy.health -= 1
  end
end
