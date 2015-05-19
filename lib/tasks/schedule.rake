namespace :schedule do
  
  task motivation: :environment do

    Event.all.each do |e|
      time = rand(11.0..16.0)
      MotivationWorker.perform_in(time.hours, e.id)
      Rails.logger.info("Schedules worker to perform in #{time} hours.")
    end

  end

end
