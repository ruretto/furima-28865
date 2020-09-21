require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      # 空では登録できない
      it "nicknameが空では登録できないこと" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")  
      end

      it "emailが空では登録できないこと" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")  
      end

      it "passwordが空では登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが6文字以上であれば登録できること" do
        @user.password = "12345a"
        @user.password_confirmation = "12345a"
        expect(@user).to be_valid
      end

      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
       @user.password_confirmation = nil
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation can't be blank") 
      end

      it "family_nameが空だと登録できないこと" do
       @user.family_name = nil
       @user.valid?
       expect(@user.errors.full_messages).to include("Family name can't be blank")  
      end
  
      it "first_nameが空だと登録できないこと" do
       @user.first_name = nil
       @user.valid?
       expect(@user.errors.full_messages).to include("First name can't be blank")  
      end

      it "family_name_kanaが空だと登録できないこと" do
       @user.family_name_kana = nil
       @user.valid?
       expect(@user.errors.full_messages).to include("Family name kana can't be blank")  
      end
  
      it "first_name_kanaが空だと登録できないこと" do
       @user.first_name_kana = nil
       @user.valid?
       expect(@user.errors.full_messages).to include("First name kana can't be blank")  
      end

      it "birth_dayが空だと登録できないこと" do
       @user.birth_day = nil
       @user.valid?
       expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end

    # 全角でなければ登録できない
    it 'family_nameが全角入力でなければ登録できないこと' do
      @user.family_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end

    it "first_nameが全角入力でなければ登録できないこと" do
      @user.first_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    # 全角カナでばければ登録できない
    it 'family_name_kanaが全角カタカナでなければ登録できないこと' do
      @user.family_name_kana = "あいうえお"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end

    it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
       @user.first_name_kana = "あいうえお"
       @user.valid?
       expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    # emailに@がない、重複したら登録できない
    it "emailに@がない場合は登録できないこと " do
      @user.email = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
  
    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
     expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    # パスワード英字のみ、または数字のみでは登録できない
    it "passwordが数字のみの場合は登録できないこと" do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordが英文字のみの場合は登録できないこと" do
     @user.password = "abcdef"
     @user.valid?
     expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
  end
end