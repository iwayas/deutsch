require 'rails_helper'

# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe User do
  describe '#create' do

    it "name、email、passwordが存在すれば登録できる" do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end

    it "nameがない場合は登録できない" do
      user = FactoryBot.build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください", "は1文字以上で入力してください")
    end

    it "nameが9文字以上の場合は登録できない" do
      user = FactoryBot.build(:user, name: "aaaaaaaaa")
      user.valid?
      expect(user.errors[:name]).to include("は8文字以内で入力してください")
    end

    it "nameが8文字以下の場合は登録できる" do
      user = FactoryBot.build(:user, name: "aaaaaaaa")
      expect(user).to be_valid
    end

    it "emailがない場合は登録できない" do
      user = FactoryBot.build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "emailは@がなければ登録できない" do
      user = FactoryBot.build(:user, email: "deutsch.co.jp")
      user.valid?
      expect(user.errors[:email]).to include("に@が含まれていません")
    end

    it "passwordがない場合は登録できない" do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが7文字以下の場合は登録できない" do
      user = FactoryBot.build(:user, password: "0000aaa")
      user.valid?
      expect(user.errors[:password]).to include("は半角英数字を含む8-12文字")
    end

    it "passwordが13文字以上の場合は登録できない" do
      user = FactoryBot.build(:user, password: "000000aaaaaaa")
      user.valid?
      expect(user.errors[:password]).to include("は半角英数字を含む8-12文字")
    end

    it "passwordは半角英数字がそれぞれ1文字以上含まれていない場合は登録できない" do
      user = FactoryBot.build(:user, password: "00000000")
      user.valid?
      expect(user.errors[:password]).to include("は半角英数字を含む8-12文字")
    end

    it "重複したemailが存在する場合は登録できない" do
      user = FactoryBot.create(:user)
      another_user = FactoryBot.build(:user, email: "test@gmail.com")
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end
    
  end
end