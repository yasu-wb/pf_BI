require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー登録が成功する時' do
    it '全ての値が正しく入力される時' do
      expect(@user).to be_valid
    end
  end

  context 'ユーザー新規登録ができない時' do
    it 'IDが空の時' do
      @user.number_id =nil
      @user.valid?
      expect(@user.errors.full_messages).to include ("Number can't be blank")
    end

    it 'IDがすでに使われている時' do
      @user.save
      another_user = FactoryBot.build(:user, number_id: @user.number_id)
      another_user.valid?
      expect(another_user.errors.full_messages).to include ("Number has already been taken")
    end

    it 'passwordが空では登録ができないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが英字のみでは登録できないこと' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordが数字のみでは登録できないこと' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end
    it 'passwordが５文字以下であれば登録できないこと' do
      @user.password = '12a45'
      @user.password_confirmation = '12a45'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123a567'
      @user.password_confirmation = '123a56'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it '苗字が空では登録ができないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters.')
    end

    it '名前が空では登録ができないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
    end
  end
end