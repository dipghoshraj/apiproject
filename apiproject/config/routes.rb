Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/posts", to: "blog_post#index"
  get "/posts/:id", to: "blog_post#show"
  post "/posts", to: "blog_post#create"
  post "/posts/update", to: "blog_post#update"
  delete "/posts", to: "blog_post#delete"
end
