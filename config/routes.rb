Rails.application.routes.draw do

  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'

  namespace :admin do
    get 'homes/top'
  end

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
    resources :users, only: [:show, :edit, :update, :destroy] do
      member do
        get :bookmarks
        get :visited_marks
        get :reviews
      end
    end
    resources :hot_springs, only: [:index, :show] do
      resource :bookmarks, only: [:create, :destroy]
      resource :visited_marks, only: [:create, :destroy]
      resources :reviews, only: [:index, :show, :create, :edit, :update, :destroy] do
        resource :favorites, only: [:create, :destroy]
        resources :comments, only: [:create, :destroy]
        patch 'reports' => 'reviews#report', as: 'report'
      end
    end
  end

  namespace :admin do
    root to: 'homes#top'
    resources :users, only: [:index, :show, :edit, :update, :destroy] do
      member do
        get :reviews
        get :comments
      end
    end
    resources :reviews, only:[:show, :destroy] do
      resources :comments, only: [:destroy]
      patch 'reports' => 'reviews#report', as: 'report'
    end
    resources :comments, only: [:index]
    resources :hot_springs, only: [:index, :show, :new, :create, :edit, :update]
  end

  # 画像が表示されなくなるため、削除
  # get '*path', controller: 'application', action: 'render_404'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
