class BuyerHistoryOrder
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :addresses, :building, :phone_number, :buyer_history_id, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id,numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :addresses
    validates :phone_number
    validates :user_id
    validates :item_id
  end

  def save
    buyer_history = BuyerHistory.create(user_id: user_id, item_id: item_id)
    Order.create(post_code: post_code, prefecture_id: prefecture_id, city: city, addresses: addresses,
                    phone_number: phone_number, building: building, buyer_history_id: buyer_history.id)
  end
end
