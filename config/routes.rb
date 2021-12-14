Rails.application.routes.draw do
  resources :galactic_pictures
  get "/nasa" => "galactic_pictures#nasa_call"

  get "/" => "index#index"
end
