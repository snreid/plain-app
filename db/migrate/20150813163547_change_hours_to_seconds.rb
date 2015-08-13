class ChangeHoursToSeconds < ActiveRecord::Migration
  def change
    rename_column :time_logs, :hours, :seconds
  end
end
