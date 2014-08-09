class Todo < ActiveRecord::Base
  scope :delayed, -> { where("deadline_at < ?", Time.current.beginning_of_day) }
  scope :future, -> { where("deadline_at > ?", Time.current.end_of_day) }
  scope :today, -> { where(deadline_at: Time.current.beginning_of_day..Time.current.end_of_day) }
  scope :done, -> { where(done: true) }
  scope :open, -> { where(done: false) }

  def appointment_delay
    difference = Time.current - deadline_at
    return 0 if difference < 0

    (difference/1.day).truncate
  end

  def appointment_future
    difference = deadline_at - Time.current

    (difference/1.day).truncate
  end

end

