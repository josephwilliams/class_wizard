This is a blog post about how ruby classes and the methods within can interact to create something beautiful: a simple program.  For greatest ease, I'd recommend using `pry` or `irb` to follow along.

# The Wizard, the Cat, and the Dragon
### a Strange Tale of Ruby Class Interaction

So you've coded up some clever ruby methods and you're feeling pretty slick.  Well, it's time to incorporate those methods into something grander: a classic good vs. evil tale with a medieval fantasy backdrop.


#### The Human Class
Our tale begins with its protagonist: a hapless wandering human.  So, let's give them a class:

```ruby
class Human
  attr_reader :name, :intellect, :location
  attr_accessor :health

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
This hash will include key value pairs for our character's `name`, `health`, and `intellect`, which are then created as instance variables.

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

#### The Wizard Class
But wait! Pixel isn't just a human.  Pixel has magic in her bones.  Pixel is a wizard.  Still, we want her to maintain the basic human abilities (methods), such as `run` and `speak`.

Within a new file, `wizard.rb`, we're setting up the Wizard class as a subclass of the Human superclass.  The `require_relative 'human'` makes sure to reference the `human.rb` file, presumably in the same directory.  The `<` operator in the class name denotes that wizard will be a subclass of human, thus containing its methods.

```ruby
require_relative 'human'

class Wizard < Human
  def speak(words)
    super + " wisely"
  end
end
```

Pixel, being a human, can do human things, such as 'run' and 'speak'.  However, being also a wizard, she would probably sound pretty smart.  We've made an adjustment to the Human class' `speak` method.  First, via `super`, we call the method in the super class, printing the input `words` in the console.  Our addition adds the `" wisely"` string.

```
[5] pry(main)> pixel.speak("is there an echo in here?")
=> "is there an echo in here?, says Pixel wisely"
```

Now, let's give Pixel some powers.

```ruby
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
```
Ah yeah.  Now Pixel can read books; learn, increasing her intellect by 1 (remember, without a `attr_writer` or `attr_accessor`, attributes like this wouldn't be changeable without specific methods that do so, like this one); and cast a spell at an enemy.

#### The Prologue Class
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

#### The Cat Class
Also!, we already know our beloved Pixel, but we can't forget Pixel's beloved cat, Palindrome.  Let's quickly code up a Cat class.

```ruby
class Cat
  attr_reader :name

  def initialize(name)
    @name = name
    speak
  end

  def distract(enemy)
    powers = [
      "backflips",
      "sand-paper licks",
      "mind control lol wut"
    ]

    enemy.distracted = true
    puts "#{@name} distracts #{enemy.name} with #{powers.sample}"
  end

  def run
    @location += 5
    "#{@name} wanders through the forest"
  end

  def speak
    sounds = ["meow", "purr", "hiss"]
    puts sounds.sample
  end
end
```

After making sure to `require_relative` our `wizard` and `cat` files in our `prologue` file, we can truly begin.  Let's use the `introduce_character` method to add our characters to the Prologue, and then let's `journey_forth`.

```ruby
[6] pry(main)> Palindrome = Cat.new("Palindrome")
meow
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

#### The Dragon Class
I did say this was going to be a classic story of good vs. evil, of heroes versus villains.  So, let's code up a villain: `dragon.rb`.

```ruby
class Dragon
  attr_reader :name
  attr_accessor :distracted, :health

  def initialize(stats)
    @name = stats[:name]
    @health = stats[:health]
    @distracted = true

    "#{@name} lets out a smokey belch"
  end

  def breath_fire(enemy)
    unless @distracted
      puts "#{@name} breathes fire at #{enemy.name}!"
      enemy.health -= 3
    else
      puts "#{@name} is distracted!"
    end
  end
end
```

Thus have we have our `dragon` class.  Not very refined; it breathes fire and it has `name`, `health`, and `distracted` instance variables.  Note the `attr_accessor :distracted, :health`.  This will allow us to check or change these attributes from outside of the class without getter or setter methods.

I've named the dragon Primus and given him 100 health.  Chilling.
```ruby
[1] pry(main)> load 'dragon.rb'
=> true
[2] pry(main)> Dragon.new({ name: "Primus", health: 100 })
Primus lets out a smokey belch
=> #<Dragon:0x007f856aab0a30 @distracted=true, @health=100, @name="Primus">
```

#### The Climactic_Battle_Scene Class
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
          #{@antagonist.name} is hungry.  And hungry dragons must eat."
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

We have methods to depict a `first_encounter`, to determine an `end_of_deadly_encounter`, and to output a `satisfying_conclusion`.  But our `battle_sequence` method is woefully lacking.

But, first, we have a more serious problem.  Pixel, our wizard, has 10 health and a `cast_spell` ability that lowers the enemy's health by 1.  Primus, the dragon, has 100 health, and can `breathe_fire`, removing 3 of his enemy's health.  This does not bode well for Pixel or her beloved cat.  But we're the authors of this tale, so let's thicken the plot.

#### The Ancient_Tome Module
There's a rhetoric device called 'deus ex machina'.  It's when a desperately hopeless protagonist is saved by seeming divine intervention.  It's happening right now.

"Pixel stumbles back, stunned.  A dragon! A real, live, fire-breathing dragon!  How could she ever defend herself? Palindrome, unmoved, sees something hidden beneath the scattered leaves on the forest floor.  He pounces on it and paws away at the rubble.  It's a book!  A book of ancient spells and esoteric oddities!  Pixel hears Palindrome's purr, picks up the tome, and reads the first page."

```ruby
module Ancient_Tome
  def decrypt(enemy)
    puts "#{enemy.name} is decrypted! What!!"
    enemy.health -= 50
  end

  def cook_tree_bark_soup
    puts "yum"
    @health += 1
  end
end
```

Woah.  A module? Awesome.  Now that Pixel has read this `Ancient_Tome`, let's go back and `include` it in the `Wizard` class.  By doing this, we 'include' the methods in the given module, making them callable within the containing Class.

```ruby
require_relative 'ancient_tome'

class Wizard < Human
  include Ancient_Tome
  ...
```

And, by my pen (keyboard), Pixel can now decrypt her enemies, and cook a mean tree bark soup.
With our new found skills, there is hope against the dragon Primus.  Let's return to the `battle_sequence` method in the `Climactic_Battle_Scene` class.

```ruby
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
```

Before we step into battle, I've made a design decision to place all my `require_relative` statements into a single file, `story_elements.rb`, as to load them all at once in pry, rather than typing them in one by one.

```ruby
require_relative 'human'
require_relative 'wizard'
require_relative 'cat'
require_relative 'dragon'
require_relative 'ancient_tome'
require_relative 'prologue'
require_relative 'climactic_battle_scene'
```
```ruby
[1] pry(main)> load 'story_elements.rb'
=> true
```

Okay, enough of that.  Let the climax begin!! In terminal, from start to finish, our story plays out:

```ruby
My-MacBook-Pro:class_wizard jw$ pry
[1] pry(main)> load 'story_elements.rb'
=> true
[2] pry(main)> pixels_stats = {
[2] pry(main)*   name: "Pixel",
[2] pry(main)*   health: 10,
[2] pry(main)*   strength: 3,
[2] pry(main)*   intellect: 7
[2] pry(main)* }
=> {:name=>"Pixel", :health=>10, :strength=>3, :intellect=>7}
[3] pry(main)>
[4] pry(main)> primus_stats = {
[4] pry(main)*   name: "Primus",
[4] pry(main)*   health: 100
[4] pry(main)* }
=> {:name=>"Primus", :health=>100}
[5] pry(main)> Pixel = Wizard.new(pixels_stats)
=> #<Wizard:0x007f95e1850c68 @health=10, @intellect=7, @location=0, @name="Pixel">
[6] pry(main)> Palindrome = Cat.new("Palindrome")
hiss
=> #<Cat:0x007f95e2256758 @name="Palindrome">
[7] pry(main)> Primus = Dragon.new(primus_stats)
Primus lets out a smokey belch
=> #<Dragon:0x007f95e2299620 @distracted=true, @health=100, @name="Primus">
[8] pry(main)> Story = Climactic_Battle_Scene.new(Pixel, Palindrome, Primus)
=> #<Climactic_Battle_Scene:0x007f95e2229640
 @antagonist=#<Dragon:0x007f95e2299620 @distracted=true, @health=100, @name="Primus">,
 @cat=#<Cat:0x007f95e2256758 @name="Palindrome">,
 @protagonist=#<Wizard:0x007f95e1850c68 @health=10, @intellect=7, @location=0, @name="Pixel">>
[9] pry(main)> Story.battle_sequence
Primus flaps his mighty wings and descends before
    the frightened wayfarers.  '7, 11, 17, 3!', he putters, fluent
    only in primes.  But Pixel understands every syllable.
    Primus is hungry.  And hungry dragons need to eat.
Primus is distracted!
Palindrome distracts Primus with sand-paper licks
Primus is distracted!
Primus is decrypted! What!!
Primus is distracted!
Palindrome distracts Primus with mind control lol wut
Primus is distracted!
Primus is decrypted! What!!
Pixel emerges victorious! Sweet relief!
```

PIXEL HAS DEFEATED PRIMUS! The `until` loop in the `battle_sequence` method continued until the conditional statement from the `end_of_deadly_encounter` was met.  Primus' health is 0.  With the conclusion of this loop, the `satisfying_conclusion` method is called, Pixel is determined the winner, and Palindrome, finder of ancient tome, deserves at least some of the credit.  The two will continue their journey, feasting on tree bark soup for many a moon.

This completes our long, strange coding journey into ruby class interactions.  Please note that everything you've just read is not necessarily best practice, but rather was written for the purpose of demonstration and experimentation.  Ruby is truly an elegant, even, at times, eloquent language that allows for clean, straightforward, english-like object-oriented programming.  As the old trite maxim goes: the possibilities are truly limitless.

Anywho, I hope you've enjoyed the tale.  Now go forth and code!
