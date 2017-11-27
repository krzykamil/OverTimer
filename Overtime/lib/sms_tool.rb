module SmsTool
  account_sid = ENV::TWILIO_ACCOUNT_SID
  auth_token = ENV::TWILIO_AUTH_TOKEN

TWILIO_AUTH_TOKEN
  @client = Twilio::REST:Client.new account_sid, auth_token

  def self.send_sms(number: , message: )
    @client.messages.create(
      from: ENV['+48583191032'],
      to: "+1#{}",
      body: "#{message}"
    )
  end
end
