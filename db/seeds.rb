# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
[Role::REGISTERED, Role::ADMIN].each do |role|
  Role.find_or_create_by({name: role})

User.create(email: 'admin@admin.com', password: 'password', role: Role.find_or_create_by({name: 'admin'}))

Article.create!(title: "Article Title", text: "Article Text", user: User.first)
Article.create!(title: "Article Title", text: "Article Text", user: User.first)
Article.create!(title: "Article Title", text: "Article Text", user: User.first)
Article.create!(title: "Article Title", text: "Article Text", user: User.first)
Article.create!(title: "Article Title", text: "Article Text", user: User.first)

Comment.create!(body: "I'm a comment!", user: User.first, article: Article.first)

end