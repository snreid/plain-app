# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

user = User.find_or_create_by(email: "test@example.com")
user.update(password: "password", first_name: "Test", last_name: "User")
user.save


csv_text = File.read([Rails.root.to_s, "lib", "Customers.csv"].join('/'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  row_hash = row.to_hash
  params = {name: row_hash["Company"],
            address_1: row_hash["Address1"],
            address_2: row_hash["Address2"],
            address_3: row_hash["Address3"],
            city: row_hash["City"],
            state: row_hash["State"],
            zip: row_hash["Zip"],
            phone_1: row_hash["Phone1"],
            phone_2: row_hash["Phone2"],
            fax_1: row_hash["Fax1"],
            fax_2: row_hash["Fax2"],
            email: row_hash["Email"],
            website: row_hash["Website"]
  }
  c = Customer.find_or_create_by(params)
  c.update(params)
end

project_names = ["Test Project 1", "Test Project 2"]
projects = []
customer = Customer.first
project_names.each do |name|
  project = Project.find_or_create_by(name: name)
  project.update({customer_id: customer.id, user_id: user.id})
  projects << project
end

task_names = ["Test Task 1", "Test Task 2"]
projects.each do |project|
  task_names.each do |name|
    task = Task.find_or_create_by({name: name, project_id: project.id, is_billable: true})
  end
  user.projects << project
end

