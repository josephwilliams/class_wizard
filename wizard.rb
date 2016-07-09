require_relative 'human'

class Wizard < Human
  def speak(words)
    super + " wisely"
  end

  def read(book, teachings)
    teachings.call
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
