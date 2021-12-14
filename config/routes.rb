Rails.application.routes.draw do
  resources :galactic_pictures
  get "/" => "index#index"
end
