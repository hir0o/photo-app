require 'rails_helper'

describe "ホームのリクエストテスト", type: :request do

  describe "GET /" do
    before do
      get root_path
    end
    it "リクエストが成功すること" do
      expect(response.status).to eq(200)
    end
  end
end
