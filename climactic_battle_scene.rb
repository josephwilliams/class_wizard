require_relative 'human'
require_relative 'wizard'
require_relative 'cat'
require_relative 'dragon'

class Climactic_Battle_Scene
  def initialize(protagonist, protagonists_sidekick, antagonist)
    @protagonist = protagonist
    @cat = protagonists_sidekick
    @antagonist = antagonist
  end

  def first_encounter
    puts "#{@antagonist.name} flaps his mighty wings and descends before
    the frightened wayfarers.  '7, 11, 17, 3!', he putters, fluent
    only in primes.  But #{@protagonist.name} understands every syllable.
    #{@antagonist.name} is hungry.  And hungry dragons need to eat."
  end

  def end_of_deadly_encounter
    @antagonist.health <= 0 or @protagonist.health <= 0
  end

  def satisfying_conclusion
    winner = @protagonist.health > @antagonist.health ? @protagonist : @antagonist
    puts "#{winner.name} emerges victorious! Sweet relief!"
  end


  def battle_sequence
    first_encounter

    until end_of_deadly_encounter
      @antagonist.breathe_fire(@protagonist)
      # oh no!
      @cat.distract(@antagonist)
      @antagonist.breathe_fire(@protagonist)
      # "Primus is distracted!"
      @protagonist.decrypt(@antagonist)
    end

    satisfying_conclusion
  end
end
