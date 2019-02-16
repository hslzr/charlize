Rails.application.routes.draw do
  resources :attendees
  get 'ui/index'
  devise_for :users

  resources :events, param: :slug do
    get :calendar, on: :member
    resources :activities, except: [:index]
  end

  resources :users

  root to: 'events#index'
end
