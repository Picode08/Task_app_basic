# coding: utf-8

User.create!( name: "管理者",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password",
              admin: true)
              
100.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

puts "Users Created"

@users = User.order(:created_at).take(3)
50.times do
  task_name = Faker::JapaneseMedia::OnePiece.character
  description = Faker::JapaneseMedia::OnePiece.akuma_no_mi
  @users.each { |user| user.tasks.create!(name: task_name, description: description) }
end

puts "Tasks Created"
