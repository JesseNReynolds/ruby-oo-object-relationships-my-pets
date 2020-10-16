class Owner
  attr_accessor
  attr_reader :name, :species
  attr_writer

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    save
  end

  def save
    @@all << self
  end

  def say_species
    return "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    working = []
    Cat.all.each do |cat|
        if cat.owner == self
            working << cat
        end
    end
    return working
  end

  def dogs
    working = []
    Dog.all.each do |dog|
        if dog.owner == self
            working << dog
        end
    end
    return working
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end
  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_dogs
    self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
  end

  def sell_cats
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def sell_pets
    self.sell_dogs
    self.sell_cats
  end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end
