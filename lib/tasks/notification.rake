namespace :notification do
  desc "Sends SMS notification to employees asking them to log overttime"
  task sms: :environment do
    if Time.now.sunday?
      employees = Employee.all
      notify_msg = "Log in and enter overtime https://std-overtime-kkp.herokuapp.com/"
      employees.each do |employee|
        AuditLog.create!(user_id: employee.id)
        SmsTool.send_sms(number: employee.phone, message: notify_msg)
      end
    end
  end

  desc "Sends email notification to manager(admin) each day to inform about pending overtime request"
  task manager_email: :environment do
    submitted_posts = Posts.submitted
    admin_users = AdminUser.all

    if submitted_posts.count > 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_later
      end
    end
  end
end
