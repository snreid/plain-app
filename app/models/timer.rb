class Timer < ActiveRecord::Base
  belongs_to :time_log
  scope :active, -> {where(end_time: nil)}

  def log_time
    self.time_log.update(seconds: self.time_log.seconds.to_i + self.duration.to_i)
  end

  def duration
    self.end_time.to_i - self.start_time.to_i
  end

  def stop
    self.update(end_time: Time.now)
    self.log_time
  end

end
