require 'rails_helper'

describe User do
  describe '#create' do

    it "全ての項目の入力が存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 空だと登録できない
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

    it "passwordが空では登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      user = build(:user, password_confirmation: nil)
      user.valid?
      expect(user.errors[:password_confirmation]).to include("can't be blank") 
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

    # 全角以外は登録できない
    it 'family_nameが全角入力でなければ登録できないこと' do
      user = build(:user, family_name: "ｱｲｳｴｵ")
      user.valid?
      expect(user.errors[:family_name]).to include("is invalid")
    end

    it 'first_nameが全角入力でなければ登録できないこと' do
      user = build(:user, first_name: "ｱｲｳｴｵ")
      user.valid?
      expect(user.errors[:first_name]).to include("is invalid")
    end

    # 全角カナ以外は登録できない
    it 'family_name_kanaが全角カタカナでなければ登録できないこと' do
      user = build(:user, family_name_kana: "あいうえお")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("is invalid")
    end

    it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
      user = build(:user, first_name_kana: "あいうえお")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("is invalid")
    end

    # パスワード文字数
      it "passwordが6文字以上であれば登録できること" do
        password = Faker::Internet.password(min_length: 6 )
        user = build(:user, password: password, password_confirmation: password)
        user.valid?
        expect(user).to be_valid
      end

    # email登録条件
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

    # パスワード英字のみ、または数字のみでは登録できない
      it "passwordが数字のみの場合は登録できないこと" do
        user = build(:user, password: "123456", password_confirmation: "123456")
        user.valid?
        expect(user.errors[:password]).to include("is invalid")
      end

      it "passwordが英文字のみの場合は登録できないこと" do
        user = build(:user, password: "abcdef")
        user.valid?
        expect(user.errors[:password]).to include("is invalid")
      end
  end
end