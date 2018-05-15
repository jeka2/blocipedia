require 'random_data'

50.times do
User.create!(
  email: "#{RandomData.random_word}@#{RandomData.random_word}.com",
  password: "password"
)
end

users = User.all

50.times do
  Wiki.create!(
    user:  users.sample,
    title: RandomData.random_sentence,
    body:  RandomData.random_paragraph
  )
end

User.create!(
  email:        "standard@example.com",
  password:     "password",
  role:         "standard",
  confirmed_at: Time.now
)

User.create!(
  email:        "premium@example.com",
  password:     "password",
  role:         "premium",
  confirmed_at: Time.now
)

User.create!(
  email:        "admin@example.com",
  password:     "password",
  role:         "admin",
  confirmed_at: Time.now
)

puts "#{Wiki.count} wikis created"
