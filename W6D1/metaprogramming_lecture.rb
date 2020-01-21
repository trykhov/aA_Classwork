def do_three_times(object, method_name)
    # Object#send calls a method
    3.times { object.send(method_name) } # calls the bark method
  end
  
  class Dog
    def bark
      puts "Woof"
    end
  end
  
#   dog = Dog.new
#   do_three_times(dog, :bark) # will print "Woof" three times

  class Dog
    # defines a class method that will define more methods; this is
    # called a **macro**.
  
    def self.makes_sound(name)
      define_method(name) { puts "#{name}!" } #define_method creates a new method with the name
    end
  
    makes_sound(:woof)  # creates a woof method
    makes_sound(:bark)
    makes_sound(:grr)
  end
  
  dog = Dog.new
  dog.woof # Dog now has woof as a method
  dog.bark
  dog.grr



  class T
    def method_missing(*args)
      p args
    end
  end

  # calls adfasdfa, since it can't be found, the program calls method_missing(*args)
#   T.new.adfasdfa(:a, :b, :c) # => [:adfasdfa, :a, :b, :c]

class Cat
    def say(anything)
      puts anything
    end
  
    def method_missing(method_name)
      method_name = method_name.to_s
      if method_name.start_with?("say_")
        text = method_name[("say_".length)..-1]
  
        say(text)
      else
        # do the usual thing when a method is missing (i.e., raise an
        # error)
        super
      end
    end
  end
  
#   earl = Cat.new
#   earl.say_hello # puts "hello"
#   earl.say_goodbye # puts "goodbye"


# RECAP
# 1. "send" calls a method
# 2. "define_method" creates a new instance method for a class object
# 3. "method_missing" is called when the program can't find a method that's called on an object



class Dog
    def self.all
      @dogs ||= [] # instance variable
    end
  
    def initialize(name)
      @name = name
  
      self.class.all << self
    end
  end
  
  class Husky < Dog
    def self.all_huskies
      @@huskies ||= [] # class variable
    end
  
    def initialize(name)
      @name = name
  
      self.class.all << self
      self.class.all_huskies << self

      p self.class.all 
      p self.class.all_huskies
     end
  end
  
  
  class HuskyPup < Husky
  end
  
#   jane = Husky.new("Jane")
#   ernest = HuskyPup.new("Ernest")


  class Corgi
    attr_reader :name
  
    def self.name
      "Corgi"
    end
  
    def initialize(name)
      @name = name
    end
  
    define_method(:output_name) do # creates a method called "output_name", when it is called, it is run
      puts name
    end
  end
  
  corgi1 = Corgi.new("doofus")
  corgi1.output_name
