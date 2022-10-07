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
    resources :members, only: [:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :photos do
      resource :favorites, only: [:create, :index, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    get 'homes/top'
    get '/homes/about' => 'homes#about', as: 'about'
  end

  namespace :admin do
    resources :members, only: [:index, :show, :edit, :update, :destroy]
    resources :photos, only: [:index, :show, :destroy] do
      resources :post_comments, only: [:destroy]
    end
    get 'homes/top'
    root to: 'admin/homes#top'
  end

  root to: 'public/homes#top'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
