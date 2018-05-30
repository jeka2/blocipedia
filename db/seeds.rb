require 'random_data'
require 'faker'

50.times do
User.create!(
  email:    Faker::Internet.email,
  password: "password",
  role: "standard"
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
  email:        "standard@standard.com",
  password:     "password",
  confirmed_at: Time.now,
  role:         "standard"
)

User.create!(
  email:        "premium@premium.com",
  password:     "password",
  confirmed_at: Time.now,
  role:         "premium"
)

User.create!(
  email:        "admin@admin.com",
  password:     "password",
  confirmed_at: Time.now,
  role:         "admin"
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
