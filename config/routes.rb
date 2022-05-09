Rails.application.routes.draw do
  # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
root to: 'public/homes#top'
get "/about" => "public/homes#about", as: "public_homes_about"
get '/items' => 'public/items#index', as: "public_items_index"
get "/customers/:id/show" => "public/customers#show", as: "public_customers_show"
get "/cart_items" => "public/cart_items#index", as: "public_cart_items_index"
get "/customers/confirm" => "public/customers#confirm", as: "public_customers_confirm"
get "/customers/:id/edit" => "public/customers#edit", as: "public_customers_edit"
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
