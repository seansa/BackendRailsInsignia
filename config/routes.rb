Rails.application.routes.draw do
  devise_for :users

  resources :programacion
  resources :articles do
    resources :comments, only: [:create, :destroy, :update]
  end
    
  put "/articles/:id/favorites" => "favorites#update", as: :favorite

  root 'welcome#index'

end
