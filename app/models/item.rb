class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :info
    validates :category_id
    validates :sales_status_id
    validates :shipping_free_status_id
    validates :scheduled_delivery_id
    validates :price
    validates :prefecture_id
  end

  has_one :buyer_history
  belongs_to :user
  has_one_attached :image

end
