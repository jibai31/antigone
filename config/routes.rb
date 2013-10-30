Antigone::Application.routes.draw do
  root 'static_pages#home'

  get 'home', :to => 'static_pages#home'
  get 'about', :to => 'static_pages#about'

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
end
