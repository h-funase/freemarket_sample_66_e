require 'rails_helper'
# RSpec.describe Address, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
describe '住所登録テスト' , model: Address do
  describe '#create' do
    it "postal_codeが空では登録不可" do
      address = build(:address, postal_code: "")
      address.valid?
      expect(address.errors[:postal_code]).to include("を入力してください")
    end

    it "postal_codeが数字XXX-XXXXではない場合登録不可" do
      address = build(:address, postal_code: "1111-1111")
      address.valid?
      expect(address.errors[:postal_code]).to include("は不正な値です")
    end

    it "prefecturesが空では登録不可" do
      address = build(:address, prefectures: "")
      address.valid?
      expect(address.errors[:prefectures]).to include("を入力してください")
    end

    it "cityが空では登録不可" do
      address = build(:address, municipality: "")
      address.valid?
      expect(address.errors[:municipality]).to include("を入力してください")
    end

    it "streetが空では登録不可" do
      address = build(:address, street_number: "")
      address.valid?
      expect(address.errors[:street_number]).to include("を入力してください")
    end

    it "f_name_kanjiが空では登録不可" do
      address = build(:address, first_name: "")
      address.valid?
      expect(address.errors[:first_name]).to include("を入力してください")
    end

    it "first_nameが16文字以上だと登録不可" do
      address = build(:address, first_name: "亜亜亜亜亜亜亜亜亜亜亜亜亜亜亜亜")
      address.valid?
      expect(address.errors[:first_name][0]).to include("は15文字以内で入力してください")
    end

    it "last_nameが空では登録不可" do
      address = build(:address, last_name: "")
      address.valid?
      expect(address.errors[:last_name]).to include("を入力してください")
    end

    it "last_nameが16文字以上だと登録不可" do
      address = build(:address, last_name: "亜亜亜亜亜亜亜亜亜亜亜亜亜亜亜亜")
      address.valid?
      expect(address.errors[:last_name][0]).to include("は15文字以内で入力してください")
    end

    it "first_name_kanaが空では登録不可" do
      address = build(:address, first_name_kana: "")
      address.valid?
      expect(address.errors[:first_name_kana]).to include("を入力してください")
    end

    it "first_name_kanaが16文字以上だと登録不可" do
      address = build(:address, first_name_kana: "アアアアアアアアアアアアアアアア")
      address.valid?
      expect(address.errors[:first_name_kana][0]).to include("は15文字以内で入力してください")
    end

    it "last_name_kanaが空では登録不可" do
      address = build(:address, last_name_kana: "")
      address.valid?
      expect(address.errors[:last_name_kana]).to include("を入力してください")
    end

    it "last_name_kanaが16文字以上だと登録不可" do
      address = build(:address, last_name_kana: "アアアアアアアアアアアアアアアア")
      address.valid?
      expect(address.errors[:last_name_kana][0]).to include("は15文字以内で入力してください")
    end
  end
end