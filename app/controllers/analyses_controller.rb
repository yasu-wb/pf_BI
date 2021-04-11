class AnalysesController < ApplicationController
  def index
    @lists = List.where(date: Date.today)
    @analysis = Analysis.new
  end

  def create
    @lists = List.where(date: Date.today)
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
    @analysis = Analysis.find(params[:id])
    respond_to do |format|
      format.html 
      format.pdf do
        pdf = WickedPdf.new.pdf_from_string(
          render_to_string(layout: 'layouts/pdf_layouts.html',
            template: 'analyses/generatepdf.html',
            title: "#{@analysis.item.name}",
            page_size: 'A4',)
        )
        send_data(pdf)
      end
    end
  end

  def generatepdf
    @analysis = Analysis.find(params[:id])
    respond_to do |format|
      format.html 
      format.pdf do
        send_data pdf.render, pdf: "#{@analysis.item.name}",
               layout: 'layouts/pdf_layouts',
               template: 'analyses/generatepdf',
               title: "#{@analysis.item.name}",
               page_size: 'A4',
               disposition: "inline"
      end
    end
  end

  private

  def analysis_params
    params.require(:analysis).permit(:tank_no, :density, :alcohol, :extract, :acid_degree, :amino_acid, :color, :nacl,
                                     :turbidity, :free_sulfurous_acid, :total_sulfurous_acid, :comment, :item_id, :list_id)
  end
end
