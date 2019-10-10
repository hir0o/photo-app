require 'rails_helper'

describe 'ログインシステムのテスト', type: :system do
  before do
    @user = FactoryBot.create(:user, name: "ユーザーA", email: "email@example.com")
  end

  context '有効なログインの場合' do
    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'email@example.com'
      fill_in 'パスワード', with: 'password'
      click_button 'Log in'
    end
    it 'ユーザーページにリダイレクトされる' do
      expect(current_path).to eq(user_path(@user))
    end
    it 'ユーザー画面が表示される' do
      expect(page).to have_content 'ユーザーA'
    end
  end
  context '無効なログインの場合' do
    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: ''
      fill_in 'パスワード', with: ''
      click_button 'Log in'
    end
    it 'エラーが表示される' do
      expect(page).to have_content 'メールアドレスまたはパスワードが違います。'
    end
  end
end