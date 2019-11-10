require 'rails_helper'

describe "リクエストのテスト", type: :request do

  describe "ルートページにアクセスすると" do
    before do
      visit root_path
    end
    it "リクエストが正常に帰ってくる" do
      expect(response).to have_http_status(200)
      expect(page).to have_content('位置情報付きで投稿できる写真投稿サイトです。')
    end
  end
end
