require 'rails_helper'

describe "リクエストのテスト", type: :request do

  describe "ルートページにアクセスすると" do
    before do
      get root_path
    end
    it "リクエストが成功すること" do
      expect(response.status).to eq(200)
    end
  end
end
