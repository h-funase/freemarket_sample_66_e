Rails.application.routes.draw do

  devise_for :installs

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
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
    member do   # idありの自作アクション
      get :selling
    end

    collection do  #idなしのあ自作アクション」」
      get :items_screen
      get :logout
    end
  end
  resources :mypages, only: [:index, :show]


  resources :mypages do
    member do
      get :personal_page
    end
  end



  resources :items,only:[:show, :edit, :update] do


    get 'cards/pay', to: 'cards#pay'
    get 'cards/confirmation', to:'cards#confirmation'
    get 'cards/complete', to:'cards#complete'
  end

  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
    end
  end

  get 'search/index'
  get '/search/detail_search', to: 'search#detail_search'
end