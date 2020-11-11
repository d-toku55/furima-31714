class ItemsController < ApplicationController
  def index
   # @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :text, :price, :status_id, :category_id, :delivery_area_id, :delivery_days_id, :delivery_burden_id, :content, :image).merge(user_id: current_user.id)
  end
end
