Rails.application.routes.draw do
  get 'pages/about'
  resources :photos, only: :index
  root 'photos#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
