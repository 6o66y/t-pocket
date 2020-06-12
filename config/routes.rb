Rails.application.routes.draw do

  devise_for :admin_accounts, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  scope module: :public do

  	root 'homes#top'

  	get 'users/retire/:id' => 'users#retire', as: 'retire'
  	patch 'users/retire/:id' => 'users#update_retire', as: 'update_retire'

  	get 'users/:id/following' => 'relationships#following', as: 'following'
  	get 'users/:id/followers' => 'relationships#followers', as: 'followers'

    get 'posts/timelines' => 'timelines#timeline', as: 'timeline'

  	resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :comments, only: [:create, :edit, :update, :destroy]
      resource :likes, only: [:create, :destroy]
    end
  	resources :relationships, only: [:create, :destroy]
  	resources :users, only: [:index, :show, :edit, :update]
  end

end
