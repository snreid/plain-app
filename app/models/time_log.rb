class TimeLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  has_many :timers
  before_create :create_timer, unless: :seconds
  before_create :set_default_date

  def active_timer
    self.timers.active.first
  end

  private

  def create_timer
    timers.build({start_time: Time.now})
  end
  def set_default_date
    self.date ||= Date.today
  end
end
