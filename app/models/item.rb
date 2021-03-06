class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :price, format: { with: /\A[0-9]+\z/ },
                      numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
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
