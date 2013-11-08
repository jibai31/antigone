class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauth_providers => [:google_oauth2, :facebook, :twitter]

  #attr_accessible :email, :password, :password_confirmation, :remember_me,
  #                :username, :provider, :uid, :avatar

  def self.from_omniauth(auth)
    if user = User.find_by_email(auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
    else
      user = User.create do |user|
        user.apply_omniauth(auth)
      end
    end
    user
  end

  def apply_omniauth(auth)
    self.provider = auth.provider
    self.uid = auth.uid
    self.username = auth.info.name
    self.email = auth.info.email if auth.info.email
    self.avatar = auth.info.image
    self.password = Devise.friendly_token[0..20]
  end

  def password_required?
    !social_signup_without_email && super
  end

  def social_signup_without_email
    !persisted? && uid && email.blank?
  end

end
