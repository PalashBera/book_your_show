Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root "home#index"
  end

  root "home#index"
end
