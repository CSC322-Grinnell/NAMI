# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@testuser = User.find(1)
providertest = Provider.create(practiceName: 'Psychiatric Associates', address: '673 Westbury Drive, Suite 201\nIowa City, IA 5224', phone: '(319) 356-6352', insurance: ['Aetna', 'Blue Cross Blue Shield'], user: @testuser)

# testuser.provider = providertest