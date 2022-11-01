Rails.application.routes.draw do

  # 会員用
  # URL /members/sign_in ...
  devise_for :members,skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  devise_scope :member do
    post 'members/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end


  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: 'admin/sessions'
  }

  scope module: :public do
    resources :members, only: [:show, :edit, :update] do
      get 'favorites' => 'favorites#index', as: 'favorites'
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      get 'unsubscribe' => 'members#unsubscribe', as: 'unsubscribe'
      patch 'withdraw' => 'members#withdraw', as: 'withdraw'
    end

    # 検索機能
    get 'relationships/followings/search' => 'relationships#search'
    get 'relationships/followers/search' => 'relationships#search'
    get 'photos/search' => 'photos#search'
    get 'search_tag' => 'photos#search_tag'
    get 'search_camera' => 'photos#search_camera'

    resources :photos do
      resource :favorites, only: [:create, :destroy]
      resources :photo_comments, only: [:create, :destroy]
      resources :maps, only: [:index]
      post 'best_photo' => 'members#best_photo', as: 'best_photo'
    end

    get 'homes/top'
    get '/homes/about' => 'homes#about', as: 'about'
  end

  namespace :admin do
    resources :members, only: [:index, :show, :edit, :update, :destroy]

    #検索機能
    get 'homes/search' => 'homes#search'
    get 'photos/search' => 'photos#search'
    get 'search_tag' => 'photos#search_tag'
    get 'search_camera' => 'photos#search_camera'

    resources :photos, only: [:index, :show, :destroy] do
      resources :photo_comments, only: [:destroy]
    end
    get 'homes/top'
    root to: 'homes#top'
  end

  root to: 'public/homes#top'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
