Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events do
    resources :category do
      resources :results
    end
    resources :teams
    resources :matches do
      resources :points
      resources :sotgs
    end
  end
end
