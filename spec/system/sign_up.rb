require 'rails_helper'

describe '新規ユーザー登録のテスト', type: :system do
  before do
    visit new_user_registration_path
  end

  describe '有効なユーザの場合' do
    before do
      fill_in 'user_name', with: 'ユーザーA'
      fill_in 'user_email', with: 'email@example.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button '登録'
    end

    it 'ユーザーページにリダイレクトされる' do
      expect(page).to have_content 'ユーザーA'
    end
  end

  describe '無効なユーザの場合' do
    before do
      fill_in 'user_name', with: ''
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
      fill_in 'user_password_confirmation', with: ''
      click_button '登録'
    end

    it '名前のエラーメッセージが表示されること' do
      expect(page).to have_content '名前を入力してください'
    end

    it 'メールアドレスのエラーメッセージが表示されること' do
      expect(page).to have_content 'メールアドレスを入力してください'
    end

    it 'パスワードのエラーメッセージが表示されること' do
      expect(page).to have_content 'パスワードを入力してください'
    end
  end
end
