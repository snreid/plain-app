class Task < ActiveRecord::Base
  belongs_to :project
  has_many :time_logs

  def time_log_for(user, date)
    time_logs.where(user_id: user.id, date: date).first
  end
end
