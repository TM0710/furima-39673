class OrderShipping
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :token, :postal_code, :region_id, :city, :street, :building, :phone, :order_id

  with_options presence: true do
    validates :token
    validates :item_id
    validates :user_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'が無効です。次のように入力してください (例: 123-4567)' }
    validates :region_id, numericality: { other_than: 1, message: "を入力してください" }
    validates :city
    validates :street
    validates :phone, length: { minimum: 10, maximum: 11, message: 'は10文字以上で入力してください' },
                      format: { with: /\A\d+\z/, message: 'が無効です。数字のみを入力してください' }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    Shipping.create(postal_code: postal_code, region_id: region_id, city: city, street: street, building: building, phone: phone,
                    order_id: order.id)
  end
end
