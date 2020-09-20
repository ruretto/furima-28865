require 'rails_helper'

describe User do
  describe '#create' do

    it "全ての項目の入力が存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end
  
    it "nicknameが空では登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")  
    end

    it "emailが空では登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")  
    end

    it "emailに@がない場合は登録できないこと " do
      user = build(:user, email: "aaaaaa")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    it "重複したemailが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "passwordが空では登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "passwordが6文字以上であれば登録できること" do
      password = Faker::Internet.password(min_length: 6 )
      user = build(:user, password: password, password_confirmation: password)
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      user = build(:user, encrypted_password: nil)
      user.valid?
      expect(user.errors[:encrypted_password]).to include("can't be blank") 
    end

    it "family_nameが空だと登録できないこと" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")  
    end
  
    it "first_nameが空だと登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")  
    end

    it "family_name_kanaが空だと登録できないこと" do
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("can't be blank")  
    end
  
    it "first_name_kanaが空だと登録できないこと" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")  
    end
  
    it "birth_dayが空だと登録できないこと" do
      user = build(:user, birth_day: nil)
      user.valid?
      expect(user.errors[:birth_day]).to include("can't be blank")
    end
  end
end