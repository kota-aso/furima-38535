class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :user_true, only: [:edit, :destroy]
  before_action :already_purchased, only: :edit

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
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(:item_name,:item_description,:item_category_id,:item_status_id,:shipping_charger_id,:prefecture_id,:days_to_ship_id,:price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def user_true
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def already_purchased
    @item = Item.find(params[:id])
    if @item.order.present?
      redirect_to root_path
    end
  end

end
