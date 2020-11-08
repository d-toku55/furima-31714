require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、family_nameとfamily_name_reading、first_nameとfirst_name_reading、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上で、英数字を両方含んでいれば登録できること' do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
        expect(@user).to be_valid
      end
      it 'ユーザー本名が、全角（漢字、ひらがな、カタカナ）であれば登録できること' do
        @user.family_name = 'あア阿'
        @user.first_name = 'あア阿'
        expect(@user).to be_valid
      end
      it 'ユーザー本名のフリガナが、全角（カタカナ）であれば登録できること' do
        @user.family_name_reading = 'カタカナ'
        @user.first_name_reading = 'カタカナ'
        expect(@user).to be_valid
      end
    end
  end

  context '新規登録がうまくいかないとき' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'family_nameとfirst_nameが空だと登録できない' do
      @user.family_name = ''
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'family_name_readingとfirst_name_readingが空だと登録できない' do
      @user.family_name_reading = ''
      @user.first_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name reading can't be blank")
      expect(@user.errors.full_messages).to include("First name reading can't be blank")
    end
    it 'family_nameとfirst_nameは、全角（漢字、ひらがな、カタカナ）じゃないと、と登録できない' do
      @user.family_name = 'aaa'
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name is invalid')
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it 'family_name_readingとfirst_name_readingは、全角（カタカナ）じゃないと、と登録できない' do
      @user.family_name_reading = 'あ阿a'
      @user.first_name_reading = 'あ阿a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name reading is invalid')
      expect(@user.errors.full_messages).to include('First name reading is invalid')
    end
    it 'birthdayが空だと登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it 'passwordが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが5文字以下だと登録できない' do
      @user.password = '123ab'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordに英数字両方を含まないと、登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
  end
end
