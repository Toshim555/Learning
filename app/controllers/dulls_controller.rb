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
    @record = Dull.find(params[:id])
    filter_text = params[:filter_text]
    if filter_text.present?
      @filtered_csv = CSV.parse(@record.csv_file.download, headers: true, encoding: "Shift_JIS").select {|row| row[NKF.nkf("-Wsx -Z4", 'お客CD')] == filter_text}
    end
    render action: 'show'
  end 
end
