# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             subject: "English",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

#その他アカウントを99個作成
99.times do |n|
  #ユーザー名も日本語化
  Faker::Config.locale = 'ja'
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  subject = "English"
  password = "password"
  User.create!(name:  name,
               email: email,
               subject: subject,
               password:              password,
               password_confirmation: password)
end

#最初の6アカウントへ50個分のArticleを追加
users = User.order(:created_at).take(6)
50.times do |i|
  Faker::Config.locale = 'ja'
  article_title = Faker::University.name
  article_body = Faker::Address.state
  case i % 6
    when 0
      article_subject = "国語"
    when 1
      article_subject = "数学"
    when 2
      article_subject = "英語"
    when 3
      article_subject = "理科"
    when 4
      article_subject = "社会"
    when 5
      article_subject = "その他"
  end
  users.each { |user| user.article.create!(title: article_title, body: article_body, subject: article_subject) }
end