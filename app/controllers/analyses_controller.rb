class AnalysesController < ApplicationController
  def index
    @lists = List.where(date: Date.today)
  end
end
