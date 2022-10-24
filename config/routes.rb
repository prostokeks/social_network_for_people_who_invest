Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: "users/registrations",
                                   sessions: "users/sessions"}

  root "static_pages#index"

  get 'profile/:id', to: 'static_pages#profile', as: 'static_pages/profile'
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

end
