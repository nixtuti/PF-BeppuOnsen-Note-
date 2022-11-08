Rails.application.routes.draw do

  namespace :admin do
    get 'homes/top'
  end
  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'

  #ゲストログイン用
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  #ユーザー新規登録、ログイン用
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #管理者ログイン用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  scope module: :public do

    resources :users, only: [:show, :edit, :update]
    get 'users/withdrawal_confirm'
    get 'users/withdrawal'

    resources :hot_springs, only: [:index, :show] do
      resource :bookmarks, only: [:create, :destroy]
      resource :visited_marks, only: [:create, :destroy]
      resources :reviews, only: [:show, :create, :edit, :update, :destroy] do
        resource :favorites, only: [:create, :destroy]
        resources :comments, only: [:create, :destroy]
      end
    end

    #余裕があればクチコミ一覧作成
    #resources :reviews, only: [:index]

  end

  namespace :admin do
    root to: 'homes#top'
    resources :customers, only: [:index, :show, :edit]
    resources :reviews, only:[:show, :destroy]
    resources :hot_springs, only: [:index, :show, :new, :edit]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
