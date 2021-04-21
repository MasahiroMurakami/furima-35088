class UsersController < ApplicationController

  def show
    @nickname = item.user.nickname
    @item = Item.find(params[:item_id])
  end



end
