Rails.application.routes.draw do
  # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
root to: 'public/homes#top'
get "public/about" => "public/homes#about", as: "public_homes_about"
get 'public/items' => 'public/items#index', as: "public_items_index"
get "public/items/:id" => "public/items#show", as: "public_items_show"
get "public/customers/show" => "public/customers#show", as: "public_customers_show"
get "public/cart_items" => "public/cart_items#index", as: "public_cart_items_index"
post "public/cart_items" => "public/cart_items#create", as: "public_cart_items_create"
get "public/customers/confirm" => "public/customers#confirm", as: "public_customers_confirm"
get "public/customers/edit" => "public/customers#edit", as: "public_customers_edit"
get "public/addresses" => "public/addresses#index", as: "public_addresses_index"
post "public/addresses" => "public/addresses#create", as: "public_addresses_create"
get "public/addresses/:id/edit" => "public/addresses#edit", as: "public_addresses_edit"
patch "/public/addresses/:id" => "public/addresses#update", as: "public_addresses_update"
get "piblic/orders/new" => "public/orders#new", as: "public_orders_new"

namespace :admin do
  resources :customers, only:[:edit, :show, :index]
end
get "/admin" => "admin/homes#top"
get "/admin/genres" => "admin/genres#index", as: "admin_genres_index"
get "/admin/genres/:id/edit" => "admin/genres#edit", as: "admin_genres_edit"
post "admin/genres" => "admin/genres#create", as: "admin_genres_create"
get "admin/items" => "admin/items#index", as: "admin_items_index"
patch "/admin/genres/:id" => "admin/genres#update", as: "admin_genres_update"
get "admin/items/new" => "admin/items#new", as: "admin_items_new"
post "admin/items" => "admin/items#create", as: "admin_items_create"
get "admin/items/:id" => "admin/items#show", as: "admin_items_show"
get "admin/items/:id/edit" => "admin/items#edit", as: "admin_items_edit"
get "/admin/orders/:id" => "admin/orders#show", as: "admin_orders_show"

# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
end
