Rails.application.routes.draw do



  namespace :public do
    get 'relationships/followings'
    get 'relationships/followers'
  end
  namespace :admin do
    get 'photos/index'
    get 'photos/show'
  end
  namespace :admin do
    get 'members/index'
    get 'members/show'
    get 'members/edit'
  end
  namespace :public do
    get 'members/index'
    get 'members/show'
    get 'members/edit'
  end
  namespace :public do
    get 'photos/index'
    get 'photos/show'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  # 顧客用
# URL /members/sign_in ...
devise_for :members,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
