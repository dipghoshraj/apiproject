Rails.application.routes.draw do
  devise_for :models
  devise_for :users
  devise_for :installs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/posts", to: "blog_post#index"
  post "/posts", to: "blog_post#create"
  post "/posts/update", to: "blog_post#update"
end
