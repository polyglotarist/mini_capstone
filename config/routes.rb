Rails.application.routes.draw do
  namespace :api do
    get '/products' => 'products#index'
    patch '/products/:id' => 'products#update'
    post '/products' => 'products#create'
  end
end
