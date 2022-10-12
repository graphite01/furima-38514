class PurchaseHistorysController < ApplicationController
  def index
    @product_history = ProductHistorys.new
    @commodity_exhibition = CommodityExhibition.find(params[:commodity_exhibition_id])
  end

  def create
    @commodity_exhibition = CommodityExhibition.find(params[:commodity_exhibition_id])
    @product_history = ProductHistorys.new(product_params)
    if @product_history.valid?
      @product_history.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def product_params
    params.require(:product_historys).permit(:post_code, :municipalities, :address, :building_name, :phone_number, :prefecture_id)
  end
end
