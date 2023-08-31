require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    item = FactoryBot.create(:item)
    order_user = FactoryBot.create(:user)
    @order_shipping = FactoryBot.build(:order_shipping, user_id: order_user.id, item_id: item.id)
  end

  context '内容に問題ない場合' do
    it '正常に登録できる' do
      expect(@order_shipping).to be_valid
    end

    it '建物名が空でも登録できる' do
      @order_shipping.building = ''
      expect(@order_shipping).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'tokenが空では登録できないこと' do
      @order_shipping.token = ''
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("クレジットカード情報を入力してください")
    end

    it 'item_idが空では登録できないこと' do
      @order_shipping.item_id = ''
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Itemを入力してください")
    end

    it 'user_idが空では登録できないこと' do
      @order_shipping.user_id = ''
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Userを入力してください")
    end

    it 'postal_codeが空では登録できないこと' do
      @order_shipping.postal_code = ''
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("郵便番号を入力してください")
    end

    it 'postal_codeが半角ハイフンを含んだ正しい形式でないと登録できないこと' do
      @order_shipping.postal_code = 1_234_567
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include('郵便番号が無効です。次のように入力してください (例: 123-4567)')
    end

    it 'region_idが1では登録できないこと' do
      @order_shipping.region_id = 1
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("都道府県を入力してください")
    end

    it 'cityが空では登録できないこと' do
      @order_shipping.city = ''
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("市町村を入力してください")
    end

    it 'streetが空では登録できないこと' do
      @order_shipping.street = ''
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("番地を入力してください")
    end

    it 'phoneが空では登録できないこと' do
      @order_shipping.phone = ''
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("電話番号を入力してください")
    end

    it 'phoneが9桁以下では登録できないこと' do
      @order_shipping.phone = 123_456_789
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include('電話番号は10文字以上で入力してください')
    end

    it 'phoneが12桁以上では登録できないこと' do
      @order_shipping.phone = 123_456_789_012
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include('電話番号は10文字以上で入力してください')
    end

    it 'phoneがハイフンを含む半角数値では登録できないこと' do
      @order_shipping.phone = '090-1234-5678'
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include('電話番号が無効です。数字のみを入力してください')
    end
  end
end
