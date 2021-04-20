class BuyerHistoryOrder
  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id,numericality: { other_than: 1 }
    validates :city
    validates :addresses
    validates :phone_number, format: {with: /\A\d{10,11}\z/ },numericality: { only_integer: true}
    validates :user_id
    validates :item_id
  end

  def save
    buyer_history = BuyerHistory.create(user_id: user_id, item_id: item_id)
    Order.create(post_code: post_code, prefecture_id: prefecture_id, city: city, addresses: addresses,
                    phone_number: phone_number, building: building, buyer_history_id: buyer_history.id)
  end
end
