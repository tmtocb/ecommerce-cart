Rails.application.routes.draw do
  root 'shops#index'
  resources :products
  resources :shops, only: %i[index show]
end
