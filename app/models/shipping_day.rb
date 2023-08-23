class ShippingDay < ActiveHash::Base
  self.data = [
    { id: 1, take_days: '---' },
    { id: 2, take_days: '1~2で発送' },
    { id: 3, take_days: '2~3で発送' },
    { id: 4, take_days: '4~7で発送' }
  ]

  include ActiveHash::Associations
  has_many :items
end
