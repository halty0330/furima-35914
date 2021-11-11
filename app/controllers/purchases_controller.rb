class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:index, :create ]

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(purchase_params)
    if @order_form.valid?
        @order_form.save
         redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:order_form).permit(:area_id, :city, :address, :code, :building_name, :telephone_number, :purchase_id).merge(user_id: current_user.id)
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end
end
