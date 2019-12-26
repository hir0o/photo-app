class HomeController < ApplicationController
  def index; end

  def map
    @posts = Post.all
    render 'map'
  end
end
