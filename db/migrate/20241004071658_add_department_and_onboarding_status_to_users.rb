class AddDepartmentAndOnboardingStatusToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :department, :string
    add_column :users, :onboarding_status, :string
  end
end
