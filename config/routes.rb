Rails.application.routes.draw do


  # 顧客用

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: "home#index"

  scope module: :public do
    root to:"homes#top"
    get "confirm" => "homes#confirm"

    resources :users, only: [:show, :edit, :update] do
      member do
      get :likes
      end

    end


    # ユーザの退会確認ページ
    get "user/unsubscribe" => "users#unsubscribe"
    #ユーザ退会処理
    patch "user/withdraw" => "users#withdraw"
  end

end
