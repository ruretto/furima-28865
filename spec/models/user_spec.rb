require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
    @user = FactoryBot.build(:user)
    end

      it "nicknameとemail、passwordとpassword_confirmation、family_nameとfirst_name、family_name_kanaとfirst_name_kana、birth_dayが存在すれば登録できること" do
        expect(@user).to be_valid
      end
  
      it "nicknameが空では登録できないこと" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors[:nickname]).to include("can't be blank")  
      end

      it "emailが空では登録できないこと" do
        @user.email = nil
        @user.valid?
        expect(@user.errors[:email]).to include("Email can't be blank")  
      end

      it "passwordが空では登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
      end

      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password") 
      end

      it "重複したemailが存在する場合登録できないこと" do
        @user = FactoryBot.create(:user, email: 'test@test.co.jp')
        another_user = FactoryBot.build(:user, email: 'test@test.co.jp')
        # @user.email = another_user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
     end

      it "family_nameが空だと登録できないこと" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors[:family_name]).to include("cannot be registered if it is empty")  
      end

      it "first_nameが空だと登録できないこと" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors[:first_name]).to include("cannot be registered if it is empty")  
      end

      it "family_name_kanaが空だと登録できないこと" do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors[:family_name_kana]).to include("cannot be registered if it is empty")  
      end

      it "first_name_kanaが空だと登録できないこと" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors[:first_name_kana]).to include("cannot be registered if it is empty")  
      end

      it "birth_dayが空だと登録できないこと" do
        @user.birth_day = "00000000"
        @user.valid?
        expect(@user.errors[:birth_day]).to include("(minimum is 8 characters)")
      end
  end
end