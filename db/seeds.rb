# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
articles = [
	{name: "iPhone 12SC Plus", price: "42000$", description: "this is a revolution"},
	{name: "Google pixel 2", price: "2000$", description: "this is a extraordinary"}
]
owners = ["matz", "younes"]
owners.each{|owner_name| Owner.find_or_create_by(name: owner_name)}
owners.each do |owner_name|
	owner = Owner.find_by_name(owner_name)
	articles.each do |article|
		owner.articles.find_or_create_by(article)
	end
end
puts "____done!____"