class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:title, :text, :price, :status_id, :category_id, :delivery_area_id, :delivery_days_id, :delivery_burden_id, :content, :image).merge(user_id: current_user.id)
  end
end
