class AddIDtoTodoodles < ActiveRecord::Migration
  def change
    add_column :todoodles, :user_id, :integer
  end
end
