require 'rails_helper'

RSpec.feature 'user', type: :feature do
  # 新しいアカウントを作成する
  scenario "user creates a new task" do
    # ユーザーを作成
    @user = User.create(
      name:     "John",
      email:    "test@example.com",
      password: "1q2w3e4r"
    )
    # ログインページへ遷移
    visit "/login"
    # メアドとパスワードを入力してログイン
    fill_in "email", with: @user.email
    fill_in "password", with: @user.password
    click_button "ログイン"
  end
end