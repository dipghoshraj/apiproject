Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/posts", to: "blog_post#index"
  post "/posts", to: "blog_post#create"
end
