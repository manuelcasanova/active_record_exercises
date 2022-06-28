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
  validates :name, :annual_revenue, :mens_apparel, :womens_apparel, presence: true
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validate :must_carry_mens_or_womens_clothes

  def must_carry_mens_or_womens_clothes
    if mens_apparel == false && womens_apparel == false
      errors.add(:mens_apparel, "You cannot create a store without men's or women's apparel")
    end
  end

  def must_have_revenue
    if annual_revenue != integer
      errors.add(:mens_apparel, "You cannot create a store without an integer as annual_revenue")
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
#new_store = Store.create(name: answer, annual_revenue: 10, mens_apparel: true)

pp "Is new store valid? " + new_store.valid?.to_s.upcase
pp "It is not valid because: "
pp "name errors: " + new_store.errors.details[:name].to_s
pp "annual_revenue errors: " + new_store.errors.details[:annual_revenue].to_s
pp "mens_apparel / womens_apparel errors: " + new_store.errors.details[:mens_apparel].to_s