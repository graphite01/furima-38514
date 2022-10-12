class PurchaseHistorysController < ApplicationController
  def index
    @product_history = ProductHistorys.new
    @commodity_exhibition = CommodityExhibition.find(params[:commodity_exhibition_id])
  end

  def create
    binding.pry
    @product_history = ProductHistorys.new(product_params)
    if @product_history.valid?
      @product_history.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product_history).permit(:post_code, :municipalities, :address, :building_name, :phone_number, :prefecture_id)
  end
end
