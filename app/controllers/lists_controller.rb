class ListsController < ApplicationController
  def index
    @lists = List.where(date: Date.today)
    @list = List.new
  end

  def new
    @list = List.new
  end

  def create
    @item = Item.find_by(incode: params[:list][:incode])

    @list = List.new(list_params)
    if @list.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  def list_params
    params.require(:list).permit(:incode).merge(date: Date.today, item_ids: [@item.id])
  end
end
