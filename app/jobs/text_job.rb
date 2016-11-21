class TextJob < ActiveJob::Base
  queue_as :default

  TWILIO_CLIENT = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT'], ENV['TWILIO_TOKEN'])
  TWILIO_NUMBER = ENV['TWILIO_NUMBER']

  def perform(receiver, message)
    number = PhonyRails.normalize_number(receiver, country_code: "US")
    begin
      TWILIO_CLIENT.messages
        .create(from: TWILIO_NUMBER, to: number, body: message)
    rescue => error
      logger.error "<TWILIO ERROR> Couldn't send message to #{number}. Error #{error.class} and message: #{error.message}"
    end
  end
end
