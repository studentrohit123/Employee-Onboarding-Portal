class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2, :linkedin]
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.department = auth.info.department
      user.role = auth.info.role
      user.onboarding_status = auth.onboarding_status
      user.phone_number = auth.info.phone_number
      user.date_of_joining = auth.info.date_of_joining
    end
  end

  def generate_two_factor_code
    self.two_factor_code = rand(100000..999999).to_s
    self.two_factor_expires_at = 10.minutes.from_now
    save!
  end

  def invalidate_two_factor_code
    self.two_factor_code = nil
    self.two_factor_expires_at = nil
    save!
  end

  def verify_two_factor_code(code)
    self.two_factor_code == code && two_factor_expires_at > Time.current
  end
end
