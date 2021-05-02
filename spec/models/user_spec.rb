require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー登録が成功する時' do
    it '全ての値が正しく入力される時' do
      expect(@user).to be_valid
    end

    it 'IDが0から始まる6桁の数字でも登録できる' do
      @user.number_id = "023456"
      expect(@user).to be_valid
    end
  end

  context 'ユーザー新規登録ができない時' do
    it 'IDが空の時' do
      @user.number_id = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('IDを入力してください')
    end

    it 'IDがすでに使われている時' do
      @user.save
      another_user = FactoryBot.build(:user, number_id: @user.number_id)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('IDはすでに存在します')
    end

    it 'IDが6桁未満の時' do
      @user.number_id = 12345
      @user.valid?
      expect(@user.errors.full_messages).to include('IDは6桁で入力してください')
    end

    it 'IDが7桁以上の時' do
      @user.number_id = 1234567
      @user.valid?
      expect(@user.errors.full_messages).to include('IDは6桁で入力してください')
    end

    it 'passwordが空では登録ができないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードを入力してください')
    end

    it 'passwordが英字のみでは登録できないこと' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは半角英数字混合で入力してください')
    end

    it 'passwordが数字のみでは登録できないこと' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは半角英数字混合で入力してください')
    end
    it 'passwordが５文字以下であれば登録できないこと' do
      @user.password = '12a45'
      @user.password_confirmation = '12a45'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123a567'
      @user.password_confirmation = '123a56'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end

    it '苗字が空では登録ができないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('姓は全角で入力してください')
    end

    it '名前が空では登録ができないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('名は全角で入力してください')
    end
  end
end
