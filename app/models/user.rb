class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: ' is invalid. Include both letters and numbers'

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: ' is invalid. Input full-width characters' } do
    validates :last_name_chinese
    validates :first_name_chinese
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: ' is invalid. Input full-width katakana characters' } do
    validates :last_name_katakana
    validates :first_name_katakana
  end

  validates :nickname, presence: true
  validates :birth_day, presence: true

  has_many :commodity_exhibitions

end
