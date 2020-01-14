Rails.application.routes.draw do
  root 'items#index'
  resources :items do
    collection do
      get :logout
      get :credit
      get :sign_up
      get :login
    end
  end

  resources :mypages, only: [:index, :show,]
end
