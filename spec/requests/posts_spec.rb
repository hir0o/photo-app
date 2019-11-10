require 'rails_helper'

RSpec.describe "投稿のリクエストテスト", type: :request do
  describe "/posts にアクセスすると" do
    before do
      visit posts_path
    end

    it "投稿一覧ページが表示される" do
      expect(page).to have_content('投稿一覧')
    end
  end

  describe "/map にアクセスすると" do
    before do
      visit '/map'
    end

    it "マップ一覧ページが表示される" do
      expect(page).to have_content('マップで見る')
    end
  end

  describe "ログインしている場合" do
    before do
      FactoryBot.create(:user)
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'test@example.com'
      fill_in 'パスワード', with: 'password'
      click_button 'Log in'
    end

    describe "/posts/newにアクセスすると" do
      before do
        visit '/posts/new'
      end

      it "投稿ページが表示される" do
        p page
        expect(page).to have_content('投稿フォーム')
      end
    end
  end

  describe "ログインしていない場合" do
    describe "/posts/newにアクセスすると" do
      before do
        visit '/posts/new'
      end

      it "エラーが表示される" do
        expect(page).to have_content('アカウント登録もしくはログインしてください。')
      end
    end
  end
end
