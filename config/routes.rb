Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session

  root "home#show"

  namespace :admin do
    resources :questions
  end

  resources :questions
end
