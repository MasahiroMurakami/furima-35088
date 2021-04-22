class UsersController < ApplicationController

  def show
    @items = Item.select("user_id")
    binding.pry
    @item = Item.find(params[:id])
  end

end

