class CreateTimers < ActiveRecord::Migration
  def change
    create_table :timers do |t|
      t.time :start_time
      t.time :end_time
      t.references :time_log
      t.timestamps null: false
    end
  end
end
