Rails.application.routes.draw do
  
  resources :products, path: '/'
  # root "products#index"
end
