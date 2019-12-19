require 'rails_helper'

RSpec.describe "ユーザーのリクエストテスト", type: :request do
  describe "/usersにアクセスすると" do
    before do
      FactoryBot.create :user1
      FactoryBot.create :user2
    end

    it "リクエストが成功すること" do
      get users_path
      expect(response.status).to eq(200)
    end

    it "user名が表示されること" do
      get users_path
      expect(response.body).to include "user1"
      expect(response.body).to include "user2"
    end
    
  end
end
