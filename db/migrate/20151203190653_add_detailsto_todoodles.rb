class AddDetailstoTodoodles < ActiveRecord::Migration
  def change
    add_column :todoodles, :title, :string
    add_column :todoodles, :description, :string
    add_column :todoodles, :tag, :string
  end
end
