class ItemsController < ApplicationController
  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :create
    end
  end

  private
  def item_params
    params.require(:item).permit(:incode, :name, :main_category, :sub_category)
  end
end
