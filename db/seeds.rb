@employee = Employee.create!(
  email: "Misteremployee@gmail.com",
  password: "Ilovemywife",
  password_confirmation: "Ilovemywife",
  first_name: "Joe",
  last_name: "Doe",
  phone: "8583191032"
)


puts "1 employee created"

AdminUser.create!(
  email: "admin2@admin.com",
  password: "blablabla",
  password_confirmation: "blablabla",
  first_name: "Admin",
  last_name: "Doe",
  phone: "2583191032"
)

puts "1 Admin user created"


100.times do |post|
  Post.create!(
    date: Date.today,
    rationale: "#{post} Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
    user_id: @employee.id,
    overtime_request: 2.5
  )
end

puts "100 Posts have been created"

AuditLog.create!(user_id: @employee.id, status: 0, start_date: (Date.today - 7.days))
AuditLog.create!(user_id: @employee.id, status: 0, start_date: (Date.today - 13.days))
AuditLog.create!(user_id: @employee.id, status: 0, start_date: (Date.today - 20.days))

puts "3 audit logs have been created"
