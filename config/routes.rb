Rails.application.routes.draw do
  root 'static_pages#index'
  get  '/index',    to: 'static_pages#index'
  get  '/post',    to: 'static_pages#post'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
end
