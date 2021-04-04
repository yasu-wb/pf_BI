class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to new_item_path, notice: '登録に成功しました'
    else
      flash.now[:alert] = '登録に失敗しました'
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:incode, :name, :main_category, :sub_category)
  end
end
