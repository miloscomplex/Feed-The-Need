class Donators::ItemsController < ApplicationController
  #before_action :set_item, only: [:show]
  before_action :logged_in_donator?



  def show
    #@items = Item.all.where(donator_id: params[:donator_id])
    @user_id = params[:donator_id]
    @items = Item.all
  end

  def edit
    @items = Item.find_by(id: params[:id])
  end

  def update
    @items = Item.find(params[:id])
    @items.update(items_params)
    redirect_to donator_path(@items.donator_id)
  end



  private

  def logged_in_donator?
    logged_in?
  end
  def set_item
    @item = Item.find_by(id: params[:id])
  end

  def items_params
    params.require(:item).permit(:donator_id)
  end

end
