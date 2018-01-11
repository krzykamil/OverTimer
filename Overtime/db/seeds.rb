@user = User.create!(
  email: "MisterUser@gmail.com",
  password: "Ilovemywife",
  password_confirmation: "Ilovemywife",
  first_name: "Joe",
  last_name: "Doe",
  phone: "8583191032"
)

puts "1 User created"

AdminUser.create!(
  email: "admin2@admin.com",
  password: "blablabla",
  password_confirmation: "blablabla",
  first_name: "Admin",
  last_name: "Doe",
  phone: "2583191032"
)

puts "1 AdminUser created"


100.times do |post|
  Post.create!(
    date: Date.today,
    rationale: "#{post} Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
    user_id: @user.id,
    overtime_request: 2.5
  )
end

puts "100 Posts have been created"

100.times do |audit_log|
  AuditLog.create!(user_id: @user.id,
    status: 0,
    start_date: (Date.today - 6.days)
  )
end

puts "100 audit logs have been created"
