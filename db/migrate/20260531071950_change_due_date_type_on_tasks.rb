class ChangeDueDateTypeOnTasks < ActiveRecord::Migration[8.1]
  def change
    change_column :tasks, :due_date, :datetime
  end
end
