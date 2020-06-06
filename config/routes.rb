Rails.application.routes.draw do
  namespace :public do
    get 'comments/edit'
  end
  namespace :public do
    get 'posts/new'
    get 'posts/index'
    get 'posts/show'
    get 'posts/edit'
  end
  namespace :public do
    get 'relationships/following'
    get 'relationships/followers'
  end
  namespace :public do
    get 'homes/top'
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
