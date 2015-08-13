class CreateTimeLogs < ActiveRecord::Migration
  def change
    create_table :time_logs do |t|
      t.date :date
      t.string :description
      t.integer :hours
      t.references :user
      t.references :task

      t.timestamps null: false
    end
  end
end
