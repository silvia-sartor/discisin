Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events do
    resources :teams, only: [:create, :edit, :show]
    resources :matches do
      resources :points
    end
    get 'results', to: 'events#results', as: :results
  end
end
