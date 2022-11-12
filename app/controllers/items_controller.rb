class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.order("created_at DESC")
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

  def show
  end

  def edit
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
      item = Item.find(params[:id])
    if current_user == item.user
      item.destroy
      redirect_to root_path
    end
  end


  private

  def item_params
    params.require(:item).permit(:item_name,:item_description,:item_category_id,:item_status_id,:shipping_charger_id,:prefecture_id,:days_to_ship_id,:price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
