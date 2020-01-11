Rails.application.routes.draw do
  root 'items#index'
  resources :items do
    collection do
      get :sell_item
    end
  end
end
