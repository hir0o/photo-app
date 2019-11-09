require 'rails_helper'

describe "リクエストのテスト", type: :request do
  describe "ルートページにアクセスすると" do
    it "リクエストが正常に帰ってくること" do
      get '/'
      expect(response).to have_http_status(200)
      expect(1 + 2).to eq 3
    end
  end
end
