class ItemsController < ApplicationController
  def index
  end


  private

  def item_params
    params.require(:item).permit(:content, :image).merge(item_id: current_user.id)
  end
end

