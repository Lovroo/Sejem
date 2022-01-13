class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  has_many :listings

  def self.from_omniauth(auth)
    name_split = auth.info.name.split(" ")
    user = User.where(email: auth.info.email).first
    user ||= User.create!(provider: auth.provider, uid: auth.uid, surname: name_split[0], name: name_split[1], email: auth.info.email, password: Devise.friendly_token[0, 20])
    user
  end
  def self.from_google(email:, full_name:, uid:, avatar_url:)
    create_with(uid: uid, username: full_name, avatar_url: avatar_url, password: Devise.friendly_token[0, 20]).find_or_create_by!(email: email)
  end
end
