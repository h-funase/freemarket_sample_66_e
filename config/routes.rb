Rails.application.routes.draw do
  root 'items#index'

  resources :items do
    collection do
      get :sell_item
      get :step2
      get :step3_1
      get :step3_2
    end
  end
end
