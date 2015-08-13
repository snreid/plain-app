class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :budget
      t.references :user
      t.references :customer
      t.timestamps null: false
    end
  end
end
