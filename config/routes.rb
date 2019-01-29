Rails.application.routes.draw do
  resources :events do
    resources :activities, except: [:index]
  end

  root to: 'events#index'
end
