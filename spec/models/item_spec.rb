require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '製品登録ができる時' do
    it '全ての情報が正しく入力されている時' do
      expect(@item).to be_valid
    end
  end

  context '製品登録ができない時' do
    it 'INコードが空では登録できない' do
      @item.incode = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("INコードを入力してください")
    end

    it 'INコードが全角数字では登録できない' do
      @item.incode = '１２３４５６'
      @item.valid?
      expect(@item.errors.full_messages).to include('INコードは半角数字で入力してください')
    end

    it '既にINコードが使われている時' do
      @item.save
      another_item = FactoryBot.build(:item, incode: @item.incode)
      another_item.valid?
      expect(another_item.errors.full_messages).to include('INコードはすでに存在します')
    end

    it '製品名が空では登録できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("製品名を入力してください")
    end

    it '主カテゴリが0では登録できない' do
      @item.main_category = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('主カテゴリーを選択してください')
    end

    it '副カテゴリが0では登録できない' do
      @item.sub_category = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('副カテゴリーを選択してください')
    end
  end
end
