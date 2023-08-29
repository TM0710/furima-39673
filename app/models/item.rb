class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :region
  belongs_to :shipping_day
  has_one_attached :image
  has_one :order, dependent: :destroy

  with_options presence: true do
    validates :image, :name, :description, :price
  end

  validates :price, inclusion: { in: 300..9_999_999, message: 'is out of setting range' },
                    numericality: { only_integer: true, message: 'is invalid. Input half-width characters' }

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id, :condition_id, :charge_id, :region_id, :shipping_day_id
  end
end
