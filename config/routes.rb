Rails.application.routes.draw do
  resources :galactic_pictures
  put "/galactic_pictures/update/like" => "galactic_pictures#update_like"

  get "/nasa" => "galactic_pictures#nasa_call"
  get "/nasa/all" => "galactic_pictures#find_all_nasa_picture"

  get "/" => "index#index"
end
