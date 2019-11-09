require 'rails_helper'

RSpec.describe "投稿のリクエストテスト", type: :request do
  describe "/posts にアクセスすると" do
    it "投稿一覧が表示されること" do
      get '/posts'
      visit '/posts'
      expect(response).to have_http_status(200)
      expect(page).to have_content('投稿一覧')
    end
  end
end
