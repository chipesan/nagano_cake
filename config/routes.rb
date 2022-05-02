Rails.application.routes.draw do
  # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
root to: 'public/homes#top'
get "/home/about" => "public/homes#about"
get '/items' => 'public/items#index'
get "/customers/show" => "public/customers#show"

get "/admin" => "admin/homes#top"
get "/admin/genres" => "admin/genres#index"
get "/admin/genres/:id/edit" => "admin/genres#edit", as: "admin_genres_edit"
post "admin/genres" => "admin/genres#create", as: "admin_genres_create"
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
end
