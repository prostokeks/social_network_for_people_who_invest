Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: "users/registrations",
                                   sessions: "users/sessions"}

  root "static_pages#index"

  get 'profile/:id', to: 'static_pages#profile', as: 'static_pages/profile'
  get 'about', to: 'static_pages#about', as: 'static_pages/about'

  resources :news do
    resources :comments
  end
  resources :forums
  resources :articles

end
