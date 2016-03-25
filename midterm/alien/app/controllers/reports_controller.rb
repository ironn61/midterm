class ReportsController < ApplicationController
	@reports = Report.all
end

def new
	@report = Report.new
end

def create
  @report = Report.new(report_params)
  @report.save

  redirect_to :action => :index
end

def show
  @report = Report.find(params[:id])
  @page_title = @report.name
end

def edit
	@report = Report.find(params[:id])
end

def update
  @report = Report.find(params[:id])
  @report.update(report_params)

  redirect_to :action => :show, :id => @report
end

def destroy
  @report = Report.find(params[:id])
  @report.destroy

  redirect_to :action => :index
end

private

def report_params
  params.require(:report).permit(:name, :description)
end