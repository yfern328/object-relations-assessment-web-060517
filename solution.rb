# Please copy/paste all three classes into this file to submit your solution!
require 'pry'

class Customer

  attr_accessor :full_name, :review

  @@all = []

  def initialize(full_name)
    @full_name = full_name
    @review = []
    @@all << self
  end

  def self.all
    @@all
  end

  # def reviews
  #   @reviews = []
  # end
  #
  # def reviews=(reviews)
  #   @reviews << review
  # end


  def self.find_by_name(full_name)
    self.all.find {|customer| customer.full_name == full_name}
  end

  def self.find_all_by_first_name(first_name)
    self.all.select {|customer| customer.full_name.split.first == first_name}
  end

  def self.all_names
    self.all.map {|customer| customer.full_name}
  end

  def add_review(restaurant, content)
    new_restaurant = Restaurant.new(restaurant) if !Restaurant.all.include?(restaurant)
    self.review = Review.new(restaurant, content)
  end

end

class Review

  attr_accessor :restaurant, :content
  @@all = []

  def initialize(restaurant, content)
    @restaurant = Restaurant.all.find {|restaurant_inst| restaurant_inst.name == restaurant}
    @content = content
    @@all << self
  end

  def self.all
    @@all
  end

  def customer
    Customer.all.select {|customer| customer.review == self}
  end

  def restaurant
    Restaurant.all.select {|restaurant| restaurant.review == self}
  end

end

class Restaurant

  attr_accessor :name, :review
  @@all = []

  def initialize(name)
    @name = name
    @review = []
    #@review <<
    #@review = Review.all.select {|review_inst| review_inst.restaurant.name == name}
    @@all << self
  end

  # def review
  #   @review
  # end

  # def review=(review)
  #   @review << review
  # end

  def self.all
    @@all
  end

  def self.find_by_name(restaurant_name)
    self.all.find {|restaurant| restaurant.name == restaurant_name}
  end

  def reviews
    Review.all.select {|review| review.restaurant == self}
  end

  def customers
    Customer.all.select {|customer| customer.review.restaurant == self}
  end

end

johnny = Customer.new("Johnny Randle")
johnnyb = Customer.new("Johnny Bubble")
sally = Customer.new("Sally Saddle")
johnnyr = Customer.new("Johnny Randle")
johnny.add_review("Chipotle", "3 Stars")
sally.add_review("Chipotle", "5 Stars")
johnnyb.add_review("McDonalds", "1 Star")
sally.add_review("Good Burger", "Always Welcoming")

#need to turn review into reviews that is an array which accepts review instances
#each restaurant needs to have a reviews array

Pry.start
