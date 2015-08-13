class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :owned_projects, class_name: "Project", foreign_key: "user_id"
  has_and_belongs_to_many :projects
  has_many :time_logs

  def full_name
    self.first_name.to_s + " " + self.last_name.to_s
  end

  def current_timer
    # timers.where(end_time: nil)
    
  end
end
