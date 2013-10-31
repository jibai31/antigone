class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def create_and_sign_user
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "Bienvenue sur PolitiQA !"
      sign_in_and_redirect user
    else
      # Should never get there
      # (omniauth login worked but an exception occurred when saving the user)
      session["devise.user_attributes"] = user.attributes
      flash.notice = "You are almost Done! Please provide a password to finish setting up your account"
      redirect_to new_user_registration_url
    end
  end

  def google_oauth2
    create_and_sign_user
  end

  def facebook
    create_and_sign_user
  end

  def twitter
    create_and_sign_user
  end
end
