Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: "users/registrations",
                                   sessions: "users/sessions"}

  root "static_pages#index"

  get 'profile/:id', to: 'users#profile', as: 'profile'
  get 'office/users/profile/:id', to: 'office/users#profile', as: 'office/user/profile'

  get 'user/:id', to: 'user#show', as: 'user'
  get 'about', to: 'static_pages#about', as: 'static_pages/about'

  resources :news do
    resources :news_comments
  end
  resources :forums do
    resources :forum_comments
  end
  resources :articles do
    resources :article_comments
  end

  resources :rooms do
    resources :messages
  end

end
