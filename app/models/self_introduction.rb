class SelfIntroduction < ApplicationRecord
  belongs_to :user
  has_many :items
  has_many :buyer_histories
end
