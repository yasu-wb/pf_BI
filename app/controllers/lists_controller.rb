class ListsController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :set_list, except: [:search, :result]
  before_action :set_lists_today, only: [:index, :create]
  before_action :search_lists, only: [:search, :result]

  def index
  end

  def new
  end

  def create
    @item = Item.find_by(incode: params[:list][:incode])
    if @item.present?
      @list = List.create(list_params)
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

  def set_list
    @list = List.new
  end

  def set_lists_today
    @lists = List.where(date: Date.today)
  end
end
