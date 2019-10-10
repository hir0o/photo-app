require 'rails_helper'

describe '投稿システムのテスト', type: :system do
  before do
    @user = FactoryBot.create(:user, name: "ユーザーA", email: "email@example.com")
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'email@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'Log in'
  end

  describe '正常な投稿な場合' do
    before do
      visit new_post_path
      fill_in 'タイトル', with: 'テストタイトル'
      fill_in 'タグ（カンマ区切り）', with: 'タグ１,タグ2'
      find(".map-serch__input").set("東京タワー")
      click_button 'map_button'
      fill_in '説明', with: 'テスト説明'
      attach_file "file-picture", "#{Rails.root}/spec/factories/sample.jpg"
      click_button '投稿'
    end
    it 'ユーザーページにリダイレクトされること' do
      expect(page).to eq(user_path(@user))
    end
    it '投稿が追加されていること' do
      expect(page).to have_content 'テストタイトル'
    end
  end

  describe '無効な投稿な場合' do
    before do
      visit new_post_path
      fill_in 'タイトル', with: ''
      fill_in 'タグ（カンマ区切り）', with: ''
      fill_in '説明', with: ''
      attach_file "file-picture", ""
      click_button '投稿'
    end
    it 'エラーが表示されること' do
      expect(page).to have_content '写真を入力してください'
      expect(page).to have_content 'タイトルを入力してください'
      expect(page).to have_content '説明を入力してください'
    end

  end
end