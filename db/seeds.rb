# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

GradeLevel.create(name: 'First')
GradeLevel.create(name: 'Second')
GradeLevel.create(name: 'Third')

Grade.create(letter: 'A', number_value: 4)
Grade.create(letter: 'B', number_value: 3)
Grade.create(letter: 'C', number_value: 2)
Grade.create(letter: 'D', number_value: 1)
Grade.create(letter: 'F', number_value: 0)
