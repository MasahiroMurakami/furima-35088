class BuyerHistory < ApplicationRecord
  belongs_to :item
  has_one :order
  belongs_to :user
  belongs_to :self_introduction
end
