require_relative 'wizard'
require_relative 'cat'

class Prologue
  attr_reader :characters

  def initialize
    @characters = []
    puts "Our adventure has begun.."
  end

  def introduce_character(character)
    @characters << character
    name = character.name

    "#{name} has entered the story!"
  end

  def journey_forth
    sentence_start = @characters.map! { |character| character.name }.join(" and ")
    sentence_end = " begin their journey.."
    sentence_start + sentence_end
  end

  def begin_story
    @characters.each do |character|
      introduce_character(character)
    end

    journey_forth
  end
end
