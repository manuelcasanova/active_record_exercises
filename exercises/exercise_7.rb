require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...

class Store < ActiveRecord::Base
  validates :name, :annual_revenue, presence: true
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validate :carries_mens_or_womens_apparel

  def carries_mens_or_womens_apparel
    if mens_apparel == false && womens_apparel == false
      errors.add(:mens_apparel, "You cannot create a store without men's or women's apparel")
    end
  end
end

class Employee < ActiveRecord::Base
  validates :first_name, :last_name, :store, presence: true
  validates :hourly_rate, numericality: { greater_than_or_equal_to: 40, less_than_or_equal_to: 200, only_integer: true }
end

print 'Add a store name '
answer = gets.chomp.to_s

new_store = Store.create(name: answer)
# new_store = Store.create(name: answer, annual_revenue: 10, mens_apparel: true)


pp "It is not valid because: "
p new_store.errors.full_messages