Rails.application.routes.draw do
  mount HygieBackRunner::Engine => "/hygie_back_runner"

  resources :users
  post "/users/auth" => "users#login"

  resources :galactic_pictures

  get "/galactic_pictures/most/liked" => "galactic_pictures#find_most_liked"
  get "/galactic_pictures/most/download" => "galactic_pictures#find_most_download"

  put "/galactic_pictures/update/like" => "galactic_pictures#update_like"
  put "/galactic_pictures/update/download" => "galactic_pictures#update_download"

  # get "/nasa" => "galactic_pictures#nasa_call"
  # get "/nasa/all" => "galactic_pictures#find_all_nasa_picture"

  get "/" => "index#index"
end
