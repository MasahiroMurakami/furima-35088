class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password,           format: {with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/},length: { minimum: 6 }
    validates :family_name,        format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :family_name_kana,   format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name,         format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :first_name_kana,    format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birth_day
  end

  has_many :buyer_histories
  has_many :items, dependent: :destroy
end
