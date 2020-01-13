Rails.application.routes.draw do
  root 'items#index'
  resources :items do
    collection do
      get :sell_item
      get :sign_up
    end
  end
end
