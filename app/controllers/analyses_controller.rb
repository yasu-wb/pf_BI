class AnalysesController < ApplicationController
  def index
    @lists = List.where(date: Date.today)
    @analysis = Analysis.new
  end

  def create
    if @analysis = Analysis.create(analysis_params)
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def analysis_params
    params.require(:analysis).permit(:tank_no, :density, :alcohol, :extract, :acid_degree, :amino_acid, :color, :nacl, :turbidity, :free_sulfurous_acid, :total_sulfurous_acid, :comment, :item_id, :list_id)
  end
end
