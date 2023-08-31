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
    validates :image
    validates :name
    validates :description
    validates :price
  end

  validates :price, inclusion: { in: 300..9_999_999, message: 'が設定範囲外です' },
                    numericality: { only_integer: true, message: 'が無効です。半角数値を入力してください' }

  with_options numericality: { other_than: 1, message: "を入力してください" } do
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :region_id
    validates :shipping_day_id
  end
end
