class ChangeStartAndEndTime < ActiveRecord::Migration
  def up
    change_column :timers, :start_time, :datetime
    change_column :timers, :end_time, :datetime
  end

  def down
    change_column :timers, :start_time, :time
    change_column :timers, :end_time, :time
  end
end
