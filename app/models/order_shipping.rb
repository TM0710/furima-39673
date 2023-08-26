class OrderShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :city, :street, :building, :phone, :item_id, :user_id, :token


  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    Shipping.create(postal_code: postal_code, region_id: region_id, city: city, street: street, building: building, phone: phone, order_id: order.id  )
  end
end