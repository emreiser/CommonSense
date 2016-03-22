class TwilioController < ApplicationController
  protect_from_forgery with: :null_session
  
  def index 
    message_body = params["Body"]
    from_number = params["From"]

    @twilio_client = Twilio::REST::Client.new ENV["TWILIO_SID"], ENV["TWILIO_TOKEN"]

    @twilio_client.account.sms.messages.create(
      from: ENV["TWILIO_NUMBER"],
      to: from_number,
      body: "Howdy! This is your neighborhood sensor reporting for duty. Check out all of the environmental things I can sense here: http://bit.ly/1PpPJD3"
    )
  end
end