This is a blog post about how ruby classes and the methods within can interact to create something beautiful: a simple program.  For greatest ease, I'd recommend using `pry` or `irb` to follow along.

# The Wizard, the Cat, and the Dragon

So you've coded up some clever ruby methods and you're feeling pretty slick.  Well, it's time to incorporate those methods into something grander: a classic good vs. evil tale with a medieval fantasy backdrop.


#### The Human Class
Our tale begins with its protagonist: a hapless wandering human.  So, let's give them a class:

```ruby
class Human
  attr_reader :name, :health, :intellect, :location

  def initialize(stats)
    @name = stats[:name]
    @health = stats[:health]
    @intellect = stats[:intellect]
    @location = 0
  end

  def run
    @location += 5
    puts "#{@name} wanders through the forest"
  end

  def speak(words)
    puts words
  end
end
```

Let's give this a good look-over.  First, let's look at our initialize method.  This method, called upon each new instantiation of this class, requires that a 'stats' hash be passed in.
This hash will include key value pairs for our character's `name`, `health`, `strength`, and `intellect`, which are then created as instance variables.

The `attr_reader` up top acts as a getter method for the instance variables that follow.
`attr_writer` would act as a setter method, and `attr_accessor` would provide both getter and setter.  Let's see this in action.

First, we create a hash with our character's stats. Every story begins with a hero.  This one begins with Pixel, our lonely wandering wizardess.  

```ruby
  pixels_stats = {
    name: "Pixel",
    health: 10,
    intellect: 7
  }

  pixel = Human.new(pixels_stats)
```

If you've loaded your `human.rb` file correctly (type `load 'human.rb' in pry`; it should return `true`), the previous block of code should return something like this:
```
#<Human:0x007ffe48be8518 @health=10, @intellect=7, @location=0, @name="Pixel">
```

But wait! Pixel isn't just a human.  Pixel has magic coursing through her.  Pixel is a wizard.  Still, we want her to maintain the basic human abilities (methods), such as `run` and `speak`.

Within a new file, `wizard.rb`, we're setting up the Wizard class as a subclass of the Human superclass.  The `require_relative 'human'` makes sure to reference the `human.rb` file, presumably in the same directory.  The `<` operator in the class name denotes that wizard will be a subclass of human, thus containing its methods.

```ruby
require_relative 'human'

class Wizard < Human
  def speak(words)
    super + " wisely"
  end
end
```

Pixel, being a human, can do human things, such as 'run' and 'speak'.  However, being also a wizard, she would probably sound pretty smart.  We've made an adjustment to the Human class' `speak` method.  First, via `super`, we call the method in the super class, printing the input `words` in the console.  Our addition, however, adds the `" wisely"` string.

```
[5] pry(main)> pixel.speak("is there an echo in here?")
=> "is there an echo in here?, says Pixel wisely"
```

Now, let's give Pixel some powers.

```ruby
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
```
Ah yeah.  Now Pixel can read books, 'calling' upon their teachings; learn, increasing her intellect by 1 (remember, without a `attr_writer` or `attr_accessor`, attributes like this wouldn't be changeable without specific methods that do so, like this one); and cast a spell at an enemy.

Now that we've set up what's necessary for characters, it's time to begin our journey.  We'll need to create a backdrop.  What could be more fitting (and uninspired) than a Prologue Class?

```ruby
class Prologue
  attr_reader :characters

  def initialize
    @characters = []
    puts "The adventure has begun.."
  end

  def introduce_character(character)
    @characters << character
    name = character.name

    puts "#{name} has entered the story!"
  end

  def journey_forth
    sentence_start = @characters.map! { |character| character.name }.join(" and ")
    sentence_end = " begin their journey.."
    sentence_start + sentence_end
  end
end
```

So, what have we here?  We initialize our Prologue class object with an empty array for our `@characters` instance variable.  We have a method, `introduce_character` explicitly named for introducing a character, and another, `journey_forth`, for setting said characters on their journey.  This is still a tale, after all.  Code just makes it possible (and fun!).  Combining the aforementioned methods, we have a perfect prologue.

Also!, we already know our beloved Pixel, but we can't forget Pixel's beloved cat, Palindrome.  Let's quickly code up a Cat class.

```ruby
class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def distract(enemy)
    powers = [
      "backflips",
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
    sounds = ["meow", "purr", "hiss"]
    sounds.sample
  end
end
```

After making sure to `require_relative` our `wizard` and `cat` files in our `prologue` file, we can truly begin.  Let's use the `introduce_character` method to add our characters to the Prologue, and then let's `journey_forth`.

```ruby
[6] pry(main)> Palindrome = Cat.new("Palindrome")
=> #<Cat:0x007f9ef92d9b88 @name="Palindrome">
```

```ruby
[7] pry(main)> Story = Prologue.new
Our adventure has begun..
=> #<Prologue:0x007f9ef92966d0 @characters=[]>
[8] pry(main)> Story.introduce_character(Pixel)
=> "Pixel has entered the story!"
[9] pry(main)> Story.introduce_character(Palindrome)
=> "Palindrome has entered the story!"
[10] pry(main)> Story.journey_forth
=> "Pixel and Palindrome begin their journey.."
```

Great! Awesome! Drama! Well, not really.  Pixel and Palindrome are stuck in the prologue, walking and talking. But that's all they really can do.  It's up to us, the programmer, the scripter, the creative-intellectual, to pen this fable.

```ruby
[11] pry(main)> Pixel.speak("I could really go for some tacos")
=> "I could really go for some tacos, says Pixel wisely"
[12] pry(main)> Palindrome.speak
=> "meow"
```

I did say this was going to be a classic story of good vs. evil, of heroes versus villains.  So, let's code up a villain: `dragon.rb`.

```ruby
class Dragon
  attr_reader :name
  attr_accessor :distracted

  def initialize(stats)
    @name = stats[:name]
    @health = stats[:health]
    @distracted = true

    "#{@name} lets out a smokey belch"
  end

  def breath_fire(enemy)
    unless @distracted
      enemy.health -= 3
    else
      "#{@name} is distracted!"
    end
  end
end
```

Thus have we have our `dragon` class.  Not very refined; it breathes fire and it has `name`, `health`, and `distracted` instance variables.  Note the `attr_accessor :distracted`.  This will allow us to check or change this attribute from outside of the class without getter or setter methods.

I've named the dragon Primus and given him 100 health.  Chilling.
```ruby
[1] pry(main)> load 'dragon.rb'
=> true
[2] pry(main)> Dragon.new({ name: "Primus", health: 100 })
Primus lets out a smokey belch
=> #<Dragon:0x007f856aab0a30 @distracted=true, @health=100, @name="Primus">
```

This story is in desperate need of some drama.  The prologue has come to a stirring conclusion.  The scene is set.  Let the deadly encounter begin.  Let's create a new class and file to hold it: `climactic_battle_scene`.

```ruby
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
    @antagonist.health == 0 or @protagonist.health == 0
  end

  def satisfying_conclusion
    winner = @protagonist.health > @antagonist.health ? @protagonist : @antagonist
    puts "#{winner.name} emerges victorious! Sweet relief!"
  end


  def battle_sequence
    first_encounter

    until end_of_deadly_encounter
      # how will the battle unfold?
    end

    satisfying_conclusion
  end
end
```

Let's break this down.  First - the not shown: we relative_require the necessary files.  Then, we initialize our `Climactic_Battle_Scene` with the same stats hashes used previously for Pixel, Palindrome, and Primus:

```ruby
[1] pry(main)> palindromes_stats = {
[1] pry(main)*   name: "Palindrome",
[1] pry(main)*   health: 3,
[1] pry(main)*   strength: 2,
[1] pry(main)*   intellect: 2
[1] pry(main)* }
=> {:name=>"Palindrome", :health=>3, :strength=>2, :intellect=>2}
[2] pry(main)> pixels_stats = {
[2] pry(main)*   name: "Pixel",
[2] pry(main)*   health: 10,
[2] pry(main)*   strength: 3,
[2] pry(main)*   intellect: 7
[2] pry(main)* }
=> {:name=>"Pixel", :health=>10, :strength=>3, :intellect=>7}
[3] pry(main)> primus_stats = {
[3] pry(main)*   name: "Primus",
[3] pry(main)*   health: 100
[3] pry(main)* }
=> {:name=>"Primus", :health=>100}
[4] pry(main)> load 'climactic_battle_scene.rb'
=> true
[5] pry(main)> Climactic_Battle_Scene.new(palindromes_stats, pixels_stats, primus_stats)
=> #<Climactic_Battle_Scene:0x007fea032755e8
 @antagonist={:name=>"Primus", :health=>100},
 @cat={:name=>"Pixel", :health=>10, :strength=>3, :intellect=>7},
 @protagonist={:name=>"Palindrome", :health=>3, :strength=>2, :intellect=>2}>
```

We have methods to depict a `first_encounter`, to determine an `end_of_deadly_encounter`, and to render `satisfying_conclusion`.  But our `battle_sequence` method is woefully lacking.

But, first, we have a more serious problem.  Pixel, our wizard, has 10 health and a `cast_spell` ability that lowers the enemy's health by 1.  Primus, the dragon, has 100 health, and can `breathe_fire`, removing 3 of his enemy's health.  This does not bode well for Pixel or her beloved cat.  But we're the authors of this tale, so let's thicken the plot:

```ruby
module Ancient_Tome
  def decrypt(enemy)
    enemy.health -= 50
  end

  def cook_tree_bark_soup
    @health += 1
  end
end
```
