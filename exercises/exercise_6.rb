require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...

@store1.employees.create(first_name: "Manuel", last_name: "Casanova", hourly_rate: 18)
@store1.employees.create(first_name: "Laura", last_name: "Hernandez", hourly_rate: 18)
@store1.employees.create(first_name: "Aurora", last_name: "Fernandez", hourly_rate: 20)
@store2.employees.create(first_name: "Vanesa", last_name: "Casanova", hourly_rate: 20)
@store2.employees.create(first_name: "Luis", last_name: "Smith", hourly_rate: 5)
@store2.employees.create(first_name: "Kathleen", last_name: "Turner", hourly_rate: 100)