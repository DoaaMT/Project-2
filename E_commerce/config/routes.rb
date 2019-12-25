Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  root 'products#index'
  get "products" , to: "products#index"
  get "products/new", to: "products#new"
  get "products/:id", to: "products#show" # , as: :product
  resources :products, :orders
  post "products", to: "products#create"
  get "products/:id/edit", to: "products#edit", as: :product_edit
  patch "products/:id", to: "products#update"
  delete "products/:id", to: "products#destroy"
  
  get "products/showit/:id" , to: "products#showit"
  get "orders/new/:id" , to: "orders#new"
  
  get "orders/new", to: "orders#new"
  post "orders", to: "orders#create"

  get "orders" , to: "orders#index"
  
  get "add_quantity" , to: "products#add_quantity"

  get "orders/showit/:id" , to: "orders#showit"
  

end
