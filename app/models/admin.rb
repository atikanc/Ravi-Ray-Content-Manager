class Admin < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  validates :full_name, presence: true
  validates :email, presence: true

  # TODO: Change this to Ravi's email once in production
  def self.from_google(email:, full_name:, uid:, avatar_url:)
    return nil unless (email == "roboburner13@gmail.com" || email == "ravi@ravirayaudio.com")
    create_with(uid: uid, full_name: full_name, avatar_url: avatar_url).find_or_create_by!(email: email)
  end
end
