require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      visit root_path
      expect(page).to have_content('新規登録')
      visit new_user_registration_path
      fill_in 'ID', with: @user.number_id
      fill_in 'パスワード', with: @user.password
      fill_in 'パスワード再入力', with: @user.password_confirmation
      fill_in '姓', with: @user.last_name
      fill_in '名', with: @user.first_name
      select @user.in_charge1.name, from: 'user[in_charge1_id]'
      select @user.in_charge2.name, from: 'user[in_charge2_id]'
      select @user.in_charge3.name, from: 'user[in_charge3_id]'
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      expect(current_path).to eq(root_path)
      expect(page).to have_content('ログアウト')
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      visit root_path
      expect(page).to have_content('新規登録')
      visit new_user_registration_path
      fill_in 'ID', with: ''
      fill_in 'パスワード', with: ''
      fill_in 'パスワード再入力', with: ''
      fill_in '姓', with: ''
      fill_in '名',  with: ''
      select '--', from: 'user[in_charge1_id]'
      select '--', from: 'user[in_charge2_id]'
      select '--', from: 'user[in_charge3_id]'
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      expect(current_path).to eq user_registration_path
    end
  end
end
