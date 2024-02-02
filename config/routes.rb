Rails.application.routes.draw do
  get 'sessions/new'
  resources :blog_posts
  resources :users
  root 'blog_posts#index'
  get  '/index',    to: 'static_pages#index'
  get  '/post',    to: 'static_pages#post'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get   '/blog_posts/user/index', to: 'blog_posts#blogpost_user_index'

  resources :blog_posts do
    resources :comments
  end
  resources :tags


end
