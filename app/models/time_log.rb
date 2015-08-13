class TimeLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  has_many :timers
end
