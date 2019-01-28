Rails.application.routes.draw do
  resources :events do
    resources :activities
  end

  root to: 'events#index'
end
