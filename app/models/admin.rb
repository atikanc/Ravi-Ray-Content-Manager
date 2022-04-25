class Admin < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  validates :full_name, presence: true
  validates :email, presence: true

  def self.from_google(email:, full_name:, uid:, avatar_url:)
    return nil unless (email == ENV['ADMIN_EMAIL_ONE'] || email == ENV['ADMIN_EMAIL_TWO'])
    create_with(uid: uid, full_name: full_name, avatar_url: avatar_url).find_or_create_by!(email: email)
  end
end
