class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @buyer_history_order = BuyerHistoryOrder.new
    @item =Item.find(params[:item_id])
    if @item.buyer_history.present? || current_user == @item.user
      redirect_to root_path
    end
  
  end

  def create
    @item =Item.find(params[:item_id])
    @buyer_history_order = BuyerHistoryOrder.new(buyer_history_params)
    if @buyer_history_order.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: buyer_history_params[:token],
        currency: 'jpy'
      )
      @buyer_history_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_history_params
    params.require(:buyer_history_order).permit(:post_code, :prefecture_id, :city,
                   :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

end
