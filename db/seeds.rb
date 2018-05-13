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

puts "#{Wiki.count} wikis created"
