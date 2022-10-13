class PurchaseHistorysController < ApplicationController
  before_action :authenticate_user!
  before_action :sold_out_check, only: [:index, :create]

  def index
    @commodity_exhibition = CommodityExhibition.find(params[:commodity_exhibition_id])
    @product_history = ProductHistory.new
  end

  def create
    @commodity_exhibition = CommodityExhibition.find(params[:commodity_exhibition_id])
    @product_history = ProductHistory.new(product_params)
    if @product_history.valid?
      pay_item
      @product_history.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def product_params
    params.require(:product_history).permit(:post_code, :municipalities, :address, :building_name, :phone_number, :prefecture_id).merge(
      user_id: current_user.id, commodity_exhibition_id: params[:commodity_exhibition_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = 'sk_test_99c0c7cc9647ee4db3688bab'
    Payjp::Charge.create(
      amount: @commodity_exhibition.selling_price,
      card: product_params[:token],
      currency: 'jpy'
    )
  end

  def sold_out_check
    @commodity_exhibition = CommodityExhibition.find(params[:commodity_exhibition_id])
    if current_user.id == @commodity_exhibition.user_id
      redirect_to root_path
    elsif !@commodity_exhibition.purchase_history.nil?
      redirect_to root_path
    end
  end
end
