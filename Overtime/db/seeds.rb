@user = User.create!(email: "JoeDoe@gmail.com", password: "Ilovemywife", password_confirmation: "Ilovemywife", first_name: "Joe", last_name: "Doe")

puts "1 User created"
100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "100 Posts have been created"
