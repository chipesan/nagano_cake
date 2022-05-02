Rails.application.routes.draw do
  # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
root to: 'public/homes#top'
get "/home/about" => "public/homes#about"
get '/items' => 'public/items#index', as: "public_items_index"
get "/customers/show" => "public/customers#show", as: "public_customers_show"
get "/cart_items" => "public/cart_items#index", as: "public_cart_items_index"

get "/admin" => "admin/homes#top"
get "/admin/genres" => "admin/genres#index", as: "admin_genres_index"
get "/admin/genres/:id/edit" => "admin/genres#edit", as: "admin_genres_edit"
post "admin/genres" => "admin/genres#create", as: "admin_genres_create"
get "admin/items" => "admin/items#index", as: "admin_items_index"
get "admin/customers" => "admin/customers#index", as: "admin_customers_index"
patch "/admin/genres/:id" => "admin/genres#update", as: "admin_genres_update"
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
end
