class ListsController < ApplicationController
  before_action :search_lists, only: [:search, :result]

  def index
    @lists = List.where(date: Date.today)
    @list = List.new
  end

  def new
    @list = List.new
  end

  def create
    @lists = List.where(date: Date.today)
    @list = List.new
    if @item = Item.find_by(incode: params[:list][:incode])
      @list = List.new(list_params)
      @list.save
      redirect_to lists_path, notice: '当日生産リストに追加しました'
    else
      flash.now[:alert] = 'INコードが見つかりません'
      render :index
    end
  end

  def search
  end

  def result
    @results = @l.result.order(date: 'DESC').distinct
  end

  private

  def list_params
    params.require(:list).permit(:incode).merge(date: Date.today, item_ids: [@item.id])
  end

  def search_lists
    @l = List.ransack(params[:q])
  end
end
