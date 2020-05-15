require 'pry'
class Waiter

  attr_reader :name, :experience

  @@all = []

  def initialize(name, experience)
    @name = name
    @experience = experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select {|meal| meal.waiter == self}
  end

  def best_tipper
    highest_tipped_meal = meals.max_by do |meal|
      meal.tip
    end
    highest_tipped_meal.customer
  end

end