Antigone::Application.routes.draw do
  root 'static_pages#home'

  get 'static_pages/home'
  get 'static_pages/about'
end
