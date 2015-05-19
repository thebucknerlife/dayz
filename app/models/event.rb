class Event < ActiveRecord::Base

  validates_presence_of :occurs_at, :name

  def days_to
    seconds_to = occurs_at - Time.now
    (seconds_to / 86400).round(1)
  end

end
