class ProductPurchasesController < ApplicationController
  def index
  end

  def new
    @product_history = ProductHistorys.new
  end

  def create
    @product_history = ProductHistorys.new(product_params)
    if @product_history.valid?
      @product_history.save
      redirect_to root_path
    else
      render :new
    end
  end

  prvate

  def product_params
    params.require(:product_history).permit(:post_code, :municipalities, :address, :building_name, :phone_number, :prefecture_id)
  end
  
end
