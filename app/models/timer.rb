class Timer < ActiveRecord::Base
  belongs_to :time_log
  
  def log(params)
    time_log = TimeLog.find_or_create_by({user_id: self.user_id, task_id: self.task_id, date: self.date})
    
  end
end
