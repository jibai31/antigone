Antigone::Application.routes.draw do
  root 'static_pages#home'

  get 'home', :to => 'static_pages#home'
  get 'about', :to => 'static_pages#about'

  devise_for :users,
    controllers: {
      registrations: "registrations",
      omniauth_callbacks: "authentications"
    }
end
