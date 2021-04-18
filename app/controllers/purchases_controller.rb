class PurchasesController < ApplicationController
  def index
    @item =Item.find(params[:item_id])
    @buyer_history_order = BuyerHistoryOrder.new
  end

  def create
    @item =Item.find(params[:item_id])
    @buyer_history_order = BuyerHistoryOrder.new(buyer_history_params)
    if @buyer_history_order.valid?
      @buyer_history_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_history_params
    params.require(:buyer_history_order).permit(:post_code, :prefecture_id, :city,
                   :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
