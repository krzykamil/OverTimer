@user = User.create!(email: "JoeDoe@gmail.com", password: "Ilovemywife", password_confirmation: "Ilovemywife", first_name: "Joe", last_name: "Doe")

puts "1 User created"

AdminUser.create!(email: "admin@admin.com", password: "blablabla", password_confirmation: "blablabla", first_name: "Admin", last_name: "Doe")

puts "1 AdminUser created"


100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id, overtime_request: 2.5)
end

puts "100 Posts have been created"
