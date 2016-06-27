class Prologue
  attr_reader :characters

  def initialize
    @characters = []
    puts "Our adventure has begun.."
  end

  def introduce_character(character)
    @characters << character
    name = character.name

    puts "{name} has entered the story!"
  end

  def journey_forth
    generic_openers = [
      "takes their first bold steps",
      "leaves the shire",
      "finally gets out of bed"
    ]

    @characters.each do |character|
      puts "{character.name}" + generic_openers.sample
    end
  end
end
