Rails.application.routes.draw do
  root 'items#index'
  resources :items do
    collection do
      get :sell_item
      get :login
    end
  end
end
