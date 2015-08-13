class Project < ActiveRecord::Base
  belongs_to :customer
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_and_belongs_to_many :users
  has_many :tasks
end
