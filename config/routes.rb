Rails.application.routes.draw do
  root 'items#index'
  resources :items do
    collection do
      get :sell_item
      get :logout
      get :credit
      get :sign_up
      get :login
      get :userprofile
    end
  end

  resources :mypages, only: [:index, :show,]
end
