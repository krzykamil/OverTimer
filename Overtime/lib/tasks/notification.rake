namespace :notification do
  desc "Sends SMS notification to employees asking them to log overttime"
  task sms: :environment do
    # 1. Schedule  sunday 5 pm
    # 2. Iterate over all employees but no managers-admins
    # 3. Send msg with instructions and link to logtime
    # User.all.each do |user|
    #   SmsTool.send_sms()
    # end
  end

  desc "Sends email notification to manager(admin) each day" to inform about pending overtime request
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
