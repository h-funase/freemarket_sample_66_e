require 'rails_helper'

describe 'user登録テスト', model: User do 
  describe '#create' do
    it "nicknameが空だと登録不可" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "nicknameが15文字以内なら登録可能" do
      user = build(:user, nickname: "ABCDEFGHIJKLMNO")
      expect(user).to be_valid
    end

    it "nicknameが16文字以上なら登録不可" do
      user = build(:user, nickname: "ABCDEFGHIJKLMNOP")
      user.valid?
      expect(user.errors[:nickname]).to include("は15文字以内で入力してください")
    end

    it "重複したemailが存在する場合登録できない" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "emailが空では登録不可" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "emailが@を含まないと登録不可 " do
      user = build(:user, email: "aaaaa")
      user.valid?
      expect(user.errors[:email][0]).to include("は不正な値です")
    end

    it "emailの@の前に文字がないと登録不可 " do
      user = build(:user, email: "@aaa")
      user.valid?
      expect(user.errors[:email][0]).to include("は不正な値です")
    end

    it "emailの@の後に文字がないと登録不可" do
      user = build(:user, email: "aaaa@")
      user.valid?
      expect(user.errors[:email][0]).to include("は不正な値です")
    end

    it "passwordが空だと登録不可" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが6文字未満だと登録不可" do
      user = build(:user, password: "12345")
      user.valid?
      expect(user.errors[:password][0]).to include("は6文字以上で入力してください")
    end

    it "passwordが6文字以上だと登録可能" do
      user = build(:user, password: "123456")
      user.valid?
      expect(user).to be_valid
    end

    it "first_nameが空だと登録不可" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "first_name_kanaが16文字以上だと登録不可" do
      user = build(:user, first_name_kana: "アアアアアアアアアアアアアアアア")
      user.valid?
      expect(user.errors[:first_name_kana][0]).to include("は15文字以内で入力してください")
    end

    it "first_name_kanaにカナ以外が含まれると登録不可 " do
      user = build(:user, first_name_kana: "カナa")
      user.valid?
      expect(user.errors[:first_name_kana][0]).to include("は不正な値です")
    end

    it "last_name_kanaが空だと登録不可" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください")
    end

    it "last_name_kanaが16文字以上だと登録不可" do
      user = build(:user, last_name_kana: "アアアアアアアアアアアアアアアア")
      user.valid?
      expect(user.errors[:last_name_kana][0]).to include("は15文字以内で入力してください")
    end

    it "last_name_kanaにカナ以外が含まれると登録不可 " do
      user = build(:user, last_name_kana: "カナa")
      user.valid?
      expect(user.errors[:last_name_kana][0]).to include("は不正な値です")
    end

    it "birthdayが空だと登録不可" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end

    it "birthdayがdate型データXXXX-XX-XXではない場合登録不可 " do
      user = build(:user, birthday: 1989)
      user.valid?
      expect(user.errors[:birthday][0]).to include("は不正な値です")
    end

    it "phoneが空だと登録不可 " do
      user = build(:user, phone: "")
      user.valid?
      expect(user.errors[:phone][0]).to include("を入力してください")
    end

    it "すべて満たしていれば登録可" do
      user = build(:user)
      expect(user).to be_valid
    end
  end
end
