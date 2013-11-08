class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def create_and_sign_user
    omniauth = request.env["omniauth.auth"]
    user = User.from_omniauth(omniauth)
    if user.persisted?
      flash.notice = "Bienvenue sur PolitiQA !"
      sign_in_and_redirect user
    else
      # User validation failed
      # The oauth info did not contain any email (eg, Twitter account)
      # Backup the API data for later use
      session["devise.omniauth"] = omniauth.except("extra")

      flash.notice = "C'est presque bon ! Entrez un email pour finir votre enregistrement."
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
