Rails.application.routes.draw do
  
  root 'authors#home'
  resources :authors do
    resources :blogs
  end
  get '/blogs',to:'blogs#index'
  get "/list",to: "blogs#list"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
