Rails.application.routes.draw do
  resources :galactic_pictures
  get "/nasa" => "galactic_pictures#nasa_call"
  get "/nasa/all" => "galactic_pictures#find_all_nasa_picture"

  get "/" => "index#index"
end
