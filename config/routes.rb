Rails.application.routes.draw do
  root to: "homes#top"
  get 'home/about' => 'homes#about'
  devise_for :users
  resources :users, only: [:index,:show,:edit,:update]
  resources :books, only: [:new,:index,:show,:edit,:create,:update,:destroy]

  devise_scope :user do
    post "users/guest_sign_in", to: "uesrs/sessions#guest_sign_in"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
