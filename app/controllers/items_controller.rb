class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, ]

  def index

  end

  def new
    @item = Item.new
  end

  private
  def item_params
    params.require(:item).permit(:name, :info, :category_id, :sales_status_id, :shipping_free_status_id, :scheduled_delivery_id, :price, :prefecture_id, :image).merge(user_id: current_user.id)
  end

end
