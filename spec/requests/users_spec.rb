require 'rails_helper'

RSpec.describe "ユーザーのリクエストテスト", type: :request do
  describe "GET #index" do
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

  describe 'GET #show' do
    describe 'ユーザーが存在する場合' do
      before do
        user1 = FactoryBot.create(:user1)
        get user_url user1.id
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 200
      end

      it 'ユーザー名が表示されていること' do
        expect(response.body).to include 'user1'
      end
    end
  end

  describe 'GET #new' do
    it 'リクエストが成功すること' do
      get new_user_registration_path
      expect(response.status).to eq 200
    end
  end

  describe 'GET #edit' do
    before do
      user1 = FactoryBot.create(:user1)
      sign_in user1
      get edit_user_registration_path
    end

    it 'リクエストが成功すること' do
      expect(response.status).to eq 200
    end

    it 'ユーザー名が表示されていること' do
      expect(response.body).to include 'user1'
    end

    it 'メールアドレスが表示されていること' do
      expect(response.body).to include 'sample1@example.com'
    end
  end

  describe 'POST #create' do
    context 'パラメータが妥当な場合' do
      before do
        post user_registration_path, params: { user: FactoryBot.attributes_for(:user1) }
      end
      it 'リクエストが成功すること' do
        expect(response.status).to eq 302
      end

      it 'ユーザーが登録されること' do
        expect(User.last.name).to eq 'user1'
      end

      it 'リダイレクトすること' do
        expect(response).to redirect_to User.last
      end
    end

    context 'パラメータが不正な場合' do
      it 'リクエストが成功すること' do
        post users_url, params: { user: FactoryBot.attributes_for(:user1, :invalid) }
        expect(response.status).to eq 200
      end

      it 'ユーザーが登録されないこと' do
        expect do
          post users_url, params: { user: FactoryBot.attributes_for(:user1, :invalid) }
        end.to_not change(User, :count)
      end
    end
  end

  describe 'PUT #update' do

    context 'パラメータが妥当な場合' do
      before do
        @user1 = FactoryBot.create(:user1)
        sign_in @user1
        put user_registration_path, params: { user: FactoryBot.attributes_for(:user2).merge(current_password: 'password') }
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 302
      end

      it 'ユーザー名が更新されること' do
        expect(User.last.name).not_to eq 'user1'
      end

      it 'リダイレクトすること' do
        expect(response).to redirect_to User.last
      end
    end

    context 'パラメータが不正な場合' do
      before do
        @user1 = FactoryBot.create(:user1)
        sign_in @user1
        put user_registration_path, params: { user: FactoryBot.attributes_for(:user1, :invalid) }
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 200
      end

      it 'ユーザー名が変更されないこと' do
        expect(User.last.name).to eq 'user1'
      end
    end
  end
end
