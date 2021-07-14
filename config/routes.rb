Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  root to: 'homes#top'
  get 'home/about', to: 'homes#about'

  # お気に入り・コメント情報を保存・削除するアクションへのルーティング
  resources :posts do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  # お気に入り一覧ページを表示するアクションへのルーティング
  resources :users do
    member do
      get :like
    end
  end

  # タグによって絞り込んだ投稿を表示するアクションへのルーティング
  resources :tags do
    get 'posts', to: 'posts#search'
  end

  # 検索したレコードを表示するアクションへのルーティング
  resources :searches, only: [:index]

  # ゲストログイン用
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
end
