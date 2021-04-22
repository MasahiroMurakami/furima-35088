class UsersController < ApplicationController

  def show
    @items = Item.select("user_id")
    
    @item = Item.find(params[:id])
  end

end

