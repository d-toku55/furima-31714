class ItemsController < ApplicationController
  def index
    #@items = Item.all
  end

  def new
    #@Item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
