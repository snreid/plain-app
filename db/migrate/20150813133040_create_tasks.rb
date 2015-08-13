class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :is_billable
      t.references :project
      t.timestamps null: false
    end
  end
end
