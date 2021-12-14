class IndexController < ApplicationController
  def index
    render json: { message: "Welcome to DGP" }
  end
end
