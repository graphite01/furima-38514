class CommodityExhibitionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_commodity, only: [:show, :edit, :update, :destroy]
  before_action :user_only_commodity, only: [:edit, :destroy]

  def index
    @commodity_exhibitions = CommodityExhibition.includes(:user).order('created_at DESC')
  end

  def new
    @commodity_exhibition = CommodityExhibition.new
  end

  def create
    @commodity_exhibition = CommodityExhibition.new(commodity_exhibition_params)
    if @commodity_exhibition.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path unless @commodity_exhibition.purchase_history.nil?
  end

  def update
    if @commodity_exhibition.update(commodity_exhibition_params)
      redirect_to commodity_exhibition_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @commodity_exhibition.destroy
  end

  private

  def commodity_exhibition_params
    params.require(:commodity_exhibition).permit(:item_name, :explanation, :selling_price, :detail_category_id,
                                                 :detail_situation_id, :delivery_charge_id, :prefecture_id, :days_to_ship_id, :image).merge(user_id: current_user.id)
  end

  def set_commodity
    @commodity_exhibition = CommodityExhibition.find(params[:id])
  end

  def user_only_commodity
    redirect_to action: :index unless @commodity_exhibition.user_id == current_user.id
  end
end
