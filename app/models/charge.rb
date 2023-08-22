class Charge < ActiveHash::Base
  self.data = [
    { id: 1, postage: '---' },
    { id: 2, postage: '着払い(購入者負担)' },
    { id: 3, postage: '送料込み(出品者負担)' }
  ]

  include ActiveHash::Associations
  has_many :items
end
