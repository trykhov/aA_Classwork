# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all

cat1 = Cat.create(name:'Ralph', birth_date:'2015-01-22', sex: 'M', description:'chunky', color:'grey')
cat2 = Cat.create(name:'Nugget', birth_date:'2013-07-09', sex: 'F', description:'short', color:'black')
cat3 = Cat.create(name:'Fluffy', birth_date:'2013-07-09', sex: 'F', description:'sleepy', color:'white')