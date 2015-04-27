Rails.application.routes.draw do
  devise_for :users

  resources :programacion
  resources :articles do
    resources :comments, only: [:create, :destroy, :update]do
    end
  end
    
  put "/articles/:id/favorites" => "favorites#update", as: :favorite
  put "/articles/:id/commnets/:comments_id/flag" => "flags#update", as: :flags

  root 'welcome#index'
end
