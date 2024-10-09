class AddDeviseTwoFactorBackupableToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :otp_backup_codes, :string
  end
end
