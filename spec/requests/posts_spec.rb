# require 'rails_helper'

# RSpec.describe "投稿のリクエストテスト", type: :request do
#   describe "/posts にアクセスすると" do
#     before do
#       get posts_path
#     end

#     it "投稿一覧ページが表示される" do
#       expect(response.status).to eq(200)
#     end
#   end

#   describe "/map にアクセスすると" do
#     before do
#       get '/map'
#     end

#     it "マップ一覧ページが表示される" do
#       expect(response.status).to eq(200)
#     end
#   end

#   describe "ログインしている場合" do
#     before do
#       user = FactoryBot.create(:user1)
#       sign_in user
#     end

#     describe "/posts/newにアクセスすると" do
#       before do
#         get '/posts/new'
#       end

#       it "投稿ページが表示される" do
#         expect(response.status).to eq(200)
#       end
#     end
#   end

#   describe "ログインしていない場合" do
#     describe "/posts/newにアクセスすると" do
#       before do
#         get '/posts/new'
#       end

#       it "リダイレクトされること" do
#         expect(response.status).to eq(302)
#       end
#     end
#   end
# end
