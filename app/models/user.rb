class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauth_providers => [:google_oauth2, :facebook, :twitter]

  #attr_accessible :email, :password, :password_confirmation, :remember_me,
  #                :username, :provider, :uid, :avatar

  def self.from_omniauth(auth)
    logger.debug auth.to_yaml
    if user = User.find_by_email(auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
    else
      user = User.create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.username = auth.info.name
        user.email = auth.info.email
        user.avatar = auth.info.image
        user.password = Devise.friendly_token[0..20]
      end
    end
    user
  end
end
