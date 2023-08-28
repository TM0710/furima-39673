class OrderShipping
  include ActiveModel::Model
  attr_accessor  :item_id, :user_id, :token, :postal_code, :region_id, :city, :street, :building, :phone, :order_id

  with_options presence: true do
    validates :token
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street
    validates :phone, format: {with: /\A\d{10,11}\z/, message: "is too short"}
  end

  validates :phone, format: {with: /\d+\z/, message: "is invalid. Input only number"}
  

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    Shipping.create(postal_code: postal_code, region_id: region_id, city: city, street: street, building: building, phone: phone, order_id: order.id  )
  end
end