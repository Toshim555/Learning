class DullsController < ApplicationController
  def new
    @record = Dull.new
  end

  def create
    @record = Dull.create params.require(:dull).permit(:csv_file) # POINT
    redirect_to @record
  end

  def show
    @record = Dull.find(params[:id])
  end

  def edit
    @record = Dull.find(params[:id]) 
  end

  def update
    @record = Dull.find(params[:id])
    @record.update params.require(:dull).permit(:csv_file) # POINT
    redirect_to @record
  end

  def filtered 
    debugger
  end
end
