class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def distract(enemy)
    powers = [
      "jumping off walls",
      "sand-paper licks",
      "mind control lol wut"
    ]

    enemy.distracted = true
    "#{@name} distracts #{enemy.name} with #{powers.sample}"
  end

  def run
    @location += 5
    "#{@name} wanders through the forest"
  end

  def speak
    ["meow", "purr", "hiss"].sample
  end
end
