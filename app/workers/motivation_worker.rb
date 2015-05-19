class MotivationWorker
  include Sidekiq::Worker

  def perform(event_id)
    event = Event.find(event_id)
    seconds_to = event.occurs_at - Time.now
    days = (seconds_to / 86400).round(1)

    message = "DAYZ: #{event.name} is in #{days} days. Keep it up!"

    twil_payload = {
      body: message,
      to: ENV['GREG'],
      from: ENV['TWILIO_FROM']
    }
    
    begin
      response = twil.account.messages.create(twil_payload)
      
      Rails.logger.info("Successfully texted you")

    rescue Twilio::REST::RequestError => e
      Rails.logger.error("There was an error while texting #{response.to}. Twilio message:\n#{e.message}")
    end
  end

  def twil
    return Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_TOKEN'])
  end

end