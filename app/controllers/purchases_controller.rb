class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase, only: [:index, :create ]

  def index
    @order_form = OrderForm.new
    if current_user.id == @item.user_id
      redirect_to root_path
    else
    end
     redirect_to root_path unless @item.purchase.blank?
  end

  def create
    @order_form = OrderForm.new(purchase_params)
    if @order_form.valid?
      pay_item
        @order_form.save
         redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:order_form).permit(:area_id, :city, :address, :code, :building_name, :telephone_number, ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
