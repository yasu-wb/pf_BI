require 'rails_helper'

RSpec.describe "Lists", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
  end

  context 'リストに登録できる時' do
    it 'ログインしたユーザーは登録できる' do
      visit new_user_session_path
      fill_in 'ID', with: @user.number_id
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      visit lists_path
      fill_in 'INコード', with: @item.incode
      find('input[name="commit"]').click
      expect(current_path).to eq(lists_path)
      expect(page).to have_content('当日生産リストに追加しました')
      expect(page).to have_content(@item.incode)
    end
  end

  context 'リスト登録できないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      visit root_path
      visit lists_path
      fill_in 'INコード', with: @item.incode
      find('input[name="commit"]').click
      expect(current_path).to eq(new_user_session_path)
    end
  end
end

RSpec.describe "Lists", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
  end

  context 'リストに登録できない時' do
    it 'ログインユーザーでも製品が存在しなければ登録できない' do
      visit new_user_session_path
      fill_in 'ID', with: @user.number_id
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      visit lists_path
      fill_in 'INコード', with: @item.incode
      find('input[name="commit"]').click
      expect(current_path).to eq(lists_path)
      expect(page).to have_no_content('当日生産リストに追加しました')
      expect(page).to have_content('INコードが見つかりません')
    end
  end
end