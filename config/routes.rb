Rails.application.routes.draw do

  resources :uploads, path: 'events' do
     resources :comments, only: [:create]

  end
  resources :comments, only: [:destroy]

  resources :tags, only: [:show]
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  get 'dashboard' => 'pages#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
