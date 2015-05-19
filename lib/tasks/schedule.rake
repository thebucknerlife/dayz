namespace :schedule do
  
  task motivation: :environment do

    i = 0

    Event.all.each do |e|
      time = rand(11.0..16.0)
      MotivationWorker.perform_in(time.hours, e.id)
      Rails.logger.info("Schedules worker to perform in #{time} hours.")
      i += 1
    end

    twil_payload = {
      body: "DAYZ Heroku Scheduler: Just scheduled #{i} workers for later today.",
      to: ENV['GREG'],
      from: ENV['TWILIO_FROM']
    }
    twil = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_TOKEN'])

    begin
      response = twil.account.messages.create(twil_payload)
      
      Rails.logger.info("Successfully texted you")

    rescue Twilio::REST::RequestError => e
      Rails.logger.error("There was an error while texting #{response.to}. Twilio message:\n#{e.message}")
    end

  end

end
