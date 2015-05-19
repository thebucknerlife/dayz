# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Event.create(name: "Sam & Thomas' Wedding", occurs_at: DateTime.new(2015,06,13,15,00,00,-5).change(:offset => "-500"))

Event.create(name: "The Weight Challenge", occurs_at: DateTime.new(2015,8,15,13,00,00).change(:offset => "-700"))