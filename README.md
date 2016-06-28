This is a blog post about how ruby classes, and the methods within, can interact to create something beautiful: a simple program.  For greatest ease, I'd recommend using `pry` or `irb` to follow along.

# Pixel the Wizard and the Prime-Crunching Math Dragon

So you've coded up some clever ruby methods and you're feeling pretty slick.  Well, it's time to incorporate those methods into something grander: a classic good vs. evil tale with a medieval fantasy backdrop.

Our tale begins with its protagonists: a pair of hapless humans.  So, let's give them a class:

```ruby
class Human
  attr_reader :name, :health, :strength, :intellect, :location

  def initialize(stats)
    @name = stats[:name]
    @health = stats[:health]
    @strength = stats[:strength]
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
    strength: 3,
    intellect: 7
  }

  pixel = Human.new(pixels_stats)
```

If you've loaded your `human.rb` file correctly (type `load 'human.rb' in pry`; it should return `true`), the previous block of code should return something like this:
```
#<Human:0x007ffe48be8518 @health=10, @intellect=9, @location=0, @name="Pixel", @strength=3>
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
Ah yeah.  Now Pixel can read books, 'calling' upon their teachings; learn, increasing her intellect by 1 (remember, without a `attr_writer` or `attr_accessor`, attributes like this wouldn't be changeable without specific methods that do so); and cast a spell at an enemy.

I think it's time to begin our journey.  
