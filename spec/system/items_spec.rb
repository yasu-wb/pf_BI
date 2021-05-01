require 'rails_helper'

RSpec.describe "Items", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
  end

  context '新製品登録ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      sign_in(@user)
      expect(page).to have_content('新製品登録')
      visit new_item_path
      fill_in 'INコード', with: @item.incode
      fill_in '製品名', with: @item.name
      select @item.main_category.name , from: 'item[main_category_id]'
      select @item.sub_category.name , from: 'item[sub_category_id]'
      expect{
        find('input[name="commit"]').click
      }.to change { Item.count }.by(1)
      expect(current_path).to eq(new_item_path)
      expect(page).to have_content('登録に成功しました')
      expect(page).to have_content(@item.name)
    end
  end

  context '新製品登録できないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      visit root_path
      visit new_item_path
      expect(current_path).to eq(new_user_session_path)
    end
  end
end

RSpec.describe '製品情報編集', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @item1 = FactoryBot.create(:item)
    @item2 =FactoryBot.build(:item)
  end
  context '製品編集ができるとき' do
    it 'ログインしたユーザーは製品の編集ができる' do
      sign_in(@user)
      visit new_item_path
      expect(page).to have_link @item1.name, href: edit_item_path(@item1)
      visit edit_item_path(@item1)
      expect(
        find('#item_incode').value
      ).to eq(@item1.incode)
      expect(
        find('#item_name').value
      ).to eq(@item1.name)
      expect(
        find('#item_main_category_id').value
      ).to eq("#{@item1.main_category_id}")
      expect(
        find('#item_sub_category_id').value
      ).to eq("#{@item1.sub_category_id}")
      fill_in 'INコード', with: @item2.incode
      fill_in '製品名', with: @item2.name
      select @item2.main_category.name, from: 'item[main_category_id]'
      select @item2.sub_category.name, from: 'item[sub_category_id]'
      expect{
        find('input[name="commit"]').click
      }.to change { Item.count }.by(0)
      expect(current_path).to eq(new_item_path)
      expect(page).to have_content('情報の編集に成功しました')
      expect(page).to have_content(@item2.incode)
      expect(page).to have_content(@item2.name)
    end
  end
  context 'ツイート編集ができないとき' do
    it 'ログインしていないとツイートの編集画面には遷移できない' do
      visit root_path
      visit new_item_path
      expect(current_path).to eq(new_user_session_path)
    end
  end
end