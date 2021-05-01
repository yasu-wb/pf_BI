require 'rails_helper'

RSpec.describe "Analyses", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @list = FactoryBot.create(:list, incode: @item.incode)
    @analysis = FactoryBot.build(:analysis)
  end

  context '分析値の入力ができる時' do
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
      visit analyses_path
      fill_in 'タンクNo.', with: @analysis.tank_no
      fill_in '比重', with: @analysis.density
      fill_in 'Alcohol', with: @analysis.alcohol
      fill_in 'エキス', with: @analysis.extract
      find('input[name="commit"]').click
      expect(current_path).to eq(analyses_path)
      expect(page).to have_content('分析値の入力に成功しました')
      expect(page).to have_content(@analysis.tank_no)
    end
  end
end
