class HomeController < ApplicationController
  def index
    redirect_to posts_url if user_signed_in?
  end

  def about
    @test = "テキスト"
  end
end
