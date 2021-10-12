class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:new]


  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:item_name, :price, :category_id, :explanation, :condition_id, :fee_id, :area_id, :scheduled_day_id, :image).merge(user_id: current_user.id)
  end
end

