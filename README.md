This is a blog post about how ruby classes, and the methods within, can interact to create something beautiful: a simple program.  For greatest ease, I'd recommend using `pry` or `irb` to follow along.

# The Wizard, the Warrior, and the Fire-Breathing Dragon

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
    intellect: 9
  }

  pixel = Human.new(pixels_stats)
```

If you've loaded your `human.rb` file correctly, entering the last line in the previous block of code should return something like this:
```
#<Human:0x007ffe48be8518 @health=10, @intellect=9, @location=0, @name="Pixel", @strength=3>
```
