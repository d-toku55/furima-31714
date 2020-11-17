class RecordsController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @record_address = RecordAddress.new
  end

  def create
    @record_address = RecordAddress.new(record_params)
      if @record_address.valid?
        pay_item
        @record_address.save
        redirect_to root_path
      else
        render :index
      end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: record_params[:token],
      currency: 'jpy'
    )
  end

  def record_params
    params.require(:record_address).permit(:item_id, :user_id, :postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number, :record_id).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end
end
