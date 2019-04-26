Rails.application.routes.draw do

  devise_for :users

  namespace :teacher do
    resources :students
    resources :projects
    resources :graders
    root to: 'home#index'
  end

  namespace :student do
    match :profile, via: ['get', 'put', 'patch'], to: 'home#profile'
    resources :applies
    resources :graders
    root to: 'home#index'
  end

  namespace :admin do
    resources :projects
    resources :teachers
    resources :students
    resources :users
    resources :applies
    resources :graders
    root to: 'home#index'
  end

  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
