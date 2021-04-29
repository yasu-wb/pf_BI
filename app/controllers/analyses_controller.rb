class AnalysesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lists_today, only: [:index, :create]
  before_action :find_analysis, only: [:show, :generatepdf, :edit, :update]

  def index
    @analysis = Analysis.new
  end

  def create
    @analysis = Analysis.new(analysis_params)
    if @analysis.save
      flash[:notice] = '分析値の入力に成功しました'
      redirect_to analyses_path
    else
      flash.now[:alert] = '分析値の入力に失敗しました'
      render :index
    end
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        pdf = WickedPdf.new.pdf_from_string(
          render_to_string(layout: 'layouts/pdf_layouts.html',
                           template: 'analyses/generatepdf.html',
                           title: "#{@analysis.item.name}",
                           page_size: 'A4')
        )
        send_data(pdf)
      end
    end
  end

  def edit
  end

  def update
    @analysis.update(analysis_params)
    redirect_to analysis_path(@analysis.id), notice: '分析値の編集に成功しました'
  end

  def generatepdf
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{@analysis.item.name}",
              layout: 'layouts/pdf_layouts.html',
              template: 'analyses/generatepdf.html',
              title: @analysis.item.name.to_s,
              page_size: 'A4',
              disposition: 'inline'
      end
    end
  end

  private

  def analysis_params
    params.require(:analysis).permit(:tank_no, :density, :alcohol, :extract, :acid_degree, :amino_acid, :color, :nacl,
                                     :turbidity, :free_sulfurous_acid, :total_sulfurous_acid, :comment, :item_id, :list_id)
  end

  def set_lists_today
    @lists = List.where(date: Date.today)
  end

  def find_analysis
    @analysis = Analysis.find(params[:id])
  end
end
