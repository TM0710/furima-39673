require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    @order_shipping = FactoryBot.build(:order_shipping)
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
      expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
    end

    it 'item_idが空では登録できないこと' do
      @order_shipping.item_id = ''
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
    end

    it 'user_idが空では登録できないこと' do
      @order_shipping.user_id = ''
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("User can't be blank")
    end

    it 'postal_codeが空では登録できないこと' do
      @order_shipping.postal_code = ''
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeが半角ハイフンを含んだ正しい形式でないと登録できないこと' do
      @order_shipping.postal_code = 1_234_567
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
    end

    it 'region_idが1では登録できないこと' do
      @order_shipping.region_id = 1
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Region can't be blank")
    end

    it 'cityが空では登録できないこと' do
      @order_shipping.city = ''
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("City can't be blank")
    end

    it 'streetが空では登録できないこと' do
      @order_shipping.street = ''
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Street can't be blank")
    end

    it 'phoneが空では登録できないこと' do
      @order_shipping.phone = ''
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Phone can't be blank")
    end

    it 'phoneが10文字未満では登録できないこと' do
      @order_shipping.phone = 123_456_789
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include('Phone is too short')
    end

    it 'phoneがハイフンを含む半角数値では登録できないこと' do
      @order_shipping.phone = '090-1234-5678'
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include('Phone is invalid. Input only number')
    end
  end
end
