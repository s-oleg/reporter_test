class ReportsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_report, except: [:new, :create]

  def index
    @reports = current_user.reports
    @reports = Filter.new(@reports, params[:filter]).execute if params[:filter]

    respond_to do |format|
      format.html
      format.json { render json: @reports }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @report }
    end
  end

  def new
    @report = Report.new

    respond_to do |format|
      format.html
      format.json { render json: @report }
    end
  end

  def create
    @report = Report.new(params[:report].merge(user_id: current_user.id))

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render json: @report, status: :created, location: @report }
      else
        format.html { render action: "new" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @report.update_attributes(params[:report])
        format.html { redirect_to reports_path, notice: 'Report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @report.destroy

    respond_to do |format|
      format.html { redirect_to reports_url }
      format.json { head :no_content }
      format.js
    end
  end

  private

  def find_report
    @report = Report.find_by_id(params[:id])
  end
end
