Rails.application.routes.draw do

  devise_for :installs

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get    'users/signup/registration',      to: 'users/registrations#step1'
    get    'users/signup/sms_confirmation',  to: 'users/registrations#step2'
  end
  
  get '/addresses/new', to: 'addresses#step3'
  get '/cards/new', to: 'cards#step4'
  get '/signup/done', to: 'signup#done'

  resources :signup do
    collection do
      get 'index'
      get 'done' 
    end
  end

  root 'items#index'

  resources :cards,only:[:create]
  resources :addresses,only:[:create,:update]
  resources :logout, only: [:index]


  resources :items do
    collection do
      get :sell_item
      get :step2
      get :step3_1
      get :step3_2
      get :step4
      get :step5
      get :logout
      get :credit
      get :sign_up
      get :login
      get :userprofile
      get :item_buy
      get :person_check
      get :item_screen
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end





  resources :mypages do
    member do
      get :selling
    end
  end


  resources :mypages do
    member do
      get :items_screen
    end
  end

  resources :mypages, only:[:destroy]


end