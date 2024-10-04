class ChangeDateOfJoiningTypeInUsers < ActiveRecord::Migration[7.1]
  def up
    change_column :users, :date_of_joining, :date
  end

  def down
    change_column :users, :date_of_joining, :time
  end
end
