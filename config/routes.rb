Rails.application.routes.draw do

  devise_for :users
  root to: 'articles#index'
  resources :users,      only: [:show, :update, :index, :edit]
  resources :articles,  only: [:index,:new, :create,:show, :edit, :update, :destroy]do
    resources :comments, only:[:create]
end

end
