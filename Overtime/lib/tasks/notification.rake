namespace :notification do
  desc "Sends SMS notification to employees asking them to log overttime"
  task sms: :environment do
    # 1. Schedule  sunday 5 pm
    # 2. Iterate over all employees but no managers-admins
    # 3. Send msg with instructions and link to logtime
    User.all.each do |user|
      SmsTool.send_sms()
    end
  end
end
