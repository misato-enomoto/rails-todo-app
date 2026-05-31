class AddDetailsToTasks < ActiveRecord::Migration[8.1]
  def change
    add_column :tasks, :due_date, :date
    add_column :tasks, :completed_at, :datetime
    add_column :tasks, :memo, :text
  end
end
