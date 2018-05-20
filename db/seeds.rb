require 'random_data'
require 'faker'

50.times do
User.create!(
  email:    Faker::Internet.email,
  password: "password"
)
end

users = User.all

50.times do
  Wiki.create!(
    user:  users.sample,
    title: RandomData.random_sentence,
    body:  RandomData.random_paragraph,
    private: false
  )
end

User.create!(
  email:        "ex@ex.com",
  password:     "password",
  confirmed_at: Time.now
)

u = User.create!(
  email:        Faker::Internet.email,
  password:     Faker::Internet.password(8,20),
  confirmed_at: Time.now
)

Wiki.create!(
  user:  u,
  title: Faker::OnePiece.island,
  body:  Faker::OnePiece.quote
)

puts "seeded"
