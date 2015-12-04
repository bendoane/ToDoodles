class AddIDtoTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :todoodle_id, :integer
  end
end
