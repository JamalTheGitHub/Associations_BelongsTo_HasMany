class HomeController < ApplicationController
  def index
  end

  def show
    @posts = Post.all
  end
end
