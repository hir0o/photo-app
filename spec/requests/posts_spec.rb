require 'rails_helper'

RSpec.describe "投稿のリクエストテスト", type: :request do
  describe "GET #index" do
    before do
      get posts_path
    end

    it "投稿一覧ページが表示される" do
      expect(response.status).to eq(200)
    end
  end

  describe "GET #map" do
    before do
      get '/map'
    end

    it "マップ一覧ページが表示される" do
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #new' do
    describe 'ログイン指定ない場合' do
      it 'リダイレクトされること' do
        get new_post_path
        expect(response.status).to eq 302
      end
    end

    describe 'ログインしている場合' do
      before do
        user1 = FactoryBot.create(:user1)
        sign_in user1
      end

      it 'リクエストが成功すること' do
        get new_post_path
        expect(response.status).to eq 200
      end
    end
  end

  describe 'GET #edit' do
    before do
      @user1 = FactoryBot.create(:user1)
      @user2 = FactoryBot.create(:user2)
      @post = FactoryBot.create(:post, user: @user1)
    end

    describe 'ログイン指定ない場合' do
      before do
        get edit_post_path(@post)
      end

      it 'リダイレクトされること' do
        expect(response.status).to eq 302
      end
    end

    describe '投稿したユーザー以外でログインしている場合' do
      before do
        sign_in @user2
        get edit_post_path(@post)
      end

      it 'リダイレクトされること' do
        expect(response.status).to eq 302
      end
    end

    describe '投稿したユーザーでログインしている場合' do
      before do
        sign_in @user1
        get edit_post_path(@post)
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 200
      end

      it '投稿タイトルが表示されていること' do
        expect(response.body).to include 'タイトル'
      end

      it '説明が表示されていること' do
        expect(response.body).to include '説明'
      end
    end
  end

  describe 'POST #create' do
    context 'パラメータが妥当な場合' do
      before do
        user1 = FactoryBot.create(:user1)
        sign_in user1
        post posts_url, params: { post: FactoryBot.attributes_for(:post, user: user1) }
      end
      it 'リクエストが成功すること' do
        expect(response.status).to eq 302
      end

      it '投稿が作成されていること' do
        expect(Post.last.title).to eq 'タイトル'
      end
    end

    context 'パラメータが不正な場合' do
      before do
        user1 = FactoryBot.create(:user1)
        sign_in user1
        post posts_url, params: { post: FactoryBot.attributes_for(:post, :invalid, user: user1) }
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 200
      end

      it 'エラーが表示されること' do
        expect(response.body).to include 'タイトルを入力してください'
      end
    end
  end
end
