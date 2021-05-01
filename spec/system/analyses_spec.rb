require 'rails_helper'

RSpec.describe "Analyses", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @analysis = FactoryBot.build(:analysis)
  end

  context '分析値の入力ができる時' do
    it 'ログインしたユーザーは登録できる' do
      sign_in(@user)
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
  context '分析値入力できないとき'do
    it 'ログインしていないと分析値入力ページに遷移できない' do
      visit root_path
      visit analyses_path
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
