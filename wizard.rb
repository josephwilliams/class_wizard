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

palindromes_stats = {
  name: "Palindrome",
  health: 3,
  strength: 2,
  intellect: 2
}

# pixels_stats = {
#   name: "Pixel",
#   health: 10,
#   strength: 3,
#   intellect: 7
# }
# pixel = Wizard.new(pixels_stats)
#
# teachings = Proc.new { pixel.learn }
# pixel.read("book", teachings)
# p pixel
