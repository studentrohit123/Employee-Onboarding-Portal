class AddTwoFactorEnabledToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :two_factor_enabled, :boolean
  end
end
