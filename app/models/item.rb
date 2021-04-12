class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :info
    validates :price
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :sales_status_id
      validates :shipping_free_status_id
      validates :scheduled_delivery_id
      validates :prefecture_id
    end
  end

  has_one :buyer_history
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_free_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

end
