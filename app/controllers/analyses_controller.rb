class AnalysesController < ApplicationController
  def index
    @lists = List.where(date: Date.today)
    @analysis = Analysis.new
  end

  def create
    if @analysis = Analysis.create(analysis_params)
      flash[:notice] = "分析値の入力に成功しました"
      redirect_to analyses_path
    else
      flash.now[:alert] = "分析値の入力に失敗しました"
      render :index
    end
  end

  def show
    @analysis = Analysis.find(params[:id])
  end

  private

  def analysis_params
    params.require(:analysis).permit(:tank_no, :density, :alcohol, :extract, :acid_degree, :amino_acid, :color, :nacl,
                                     :turbidity, :free_sulfurous_acid, :total_sulfurous_acid, :comment, :item_id, :list_id)
  end
end
