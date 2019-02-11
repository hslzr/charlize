Rails.application.routes.draw do
  get 'ui/index'
  devise_for :users

  resources :events do
    get :calendar, on: :member
    
    resources :activities, except: [:index]
  end

  resources :users

  root to: 'events#index'
end
