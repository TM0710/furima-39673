class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?[\d])[a-zA-Z\d]+\z/.freeze
  VALID_NAME_REGEX = /\A[一-龥ぁ-ん]/.freeze
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  with_options presence: true do
    validates :nickname, :birthday
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: "is invalid. Include both letters and numbers" }
    validates :last_name, format: { with: VALID_NAME_REGEX, message: "is invalid. Input full-width characters" }
    validates :first_name, format: { with: VALID_NAME_REGEX, message: "is invalid. Input full-width characters" }
    validates :last_name_kana,  format: { with: VALID_NAME_KANA_REGEX, message: "is invalid. Input full-width katakana characters" }
    validates :first_name_kana, format: { with: VALID_NAME_KANA_REGEX, message: "is invalid. Input full-width katakana characters" }
  end
end
