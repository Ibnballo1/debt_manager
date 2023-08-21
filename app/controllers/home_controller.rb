class HomeController < ApplicationController
  def index
  end

  def new
    @home = Home.new()
  end

  def create
    @home = Home.new()

    if @home.save
      redirect_to users_path()
    else
      redirect_to :new
    end
  end
end
