Rails.application.routes.draw do

  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'
  
  #管理者ログイン用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  #ユーザー新規登録、ログイン用
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
    passwords: 'public/passwords'
  }

  namespace :public do
    
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
