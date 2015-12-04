class CreateTodoodles < ActiveRecord::Migration
  def change
    create_table :todoodles do |t|

      t.timestamps null: false
    end
  end
end
