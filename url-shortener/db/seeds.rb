# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Link.create(original_url: 'www.ironhack.com', short_url: Link.random_url)
Link.create(original_url: 'www.ironhack.com', short_url: Link.random_url)
Link.create(original_url: 'http://www.elmundo.com', short_url: Link.random_url)
