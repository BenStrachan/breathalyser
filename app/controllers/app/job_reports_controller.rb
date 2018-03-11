class App::JobReportsController < ApplicationController
  layout 'admin'
  before_action :set_job_report, only: [:show, :edit, :update, :destroy, :certificate]

  # GET /job_reports
  # GET /job_reports.json
  def index
    @query = JobReport.ransack(params[:q])
    @job_reports = @query.result(scheduled_date: :desc)
                                     .page(params[:page])
  end

  # GET /job_reports/1
  # GET /job_reports/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render(
          pdf: "Certificate",
          file: 'pdfs/certificate',
          locals: {
            job_report: @job_report
          }
        )
      end
    end
  end

  # GET /job_reports/new
  def new
    @job_report = JobReport.new user_id: params[:user_id] || current_user.id,
                                job_id: params[:job_id],
                                customer_id: params[:customer_id]
  end

  # GET /job_reports/1/edit
  def edit
  end

  # POST /job_reports
  # POST /job_reports.json
  def create
    @job_report = JobReport.new(job_report_params)

    respond_to do |format|
      if @job_report.save
        format.html { redirect_to app_job_reports_path, notice: 'Job report was successfully created.' }
        format.json { render :show, status: :created, location: @job_report }
      else
        format.html { render :new }
        format.json { render json: @job_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_reports/1
  # PATCH/PUT /job_reports/1.json
  def update
    respond_to do |format|
      if @job_report.update(job_report_params)
        format.html { redirect_to app_job_reports_path, notice: 'Job report was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_report }
      else
        format.html { render :edit }
        format.json { render json: @job_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_reports/1
  # DELETE /job_reports/1.json
  def destroy
    @job_report.destroy
    respond_to do |format|
      format.html { redirect_to app_job_reports_path, notice: 'Job report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def certificate
    if JobReportMailer.send_certificate(@job_report).deliver_now!
      @job_report.update_attribute :sent_certificate_at, Time.now
    end

    redirect_to app_job_reports_path,
                notice: 'Certificate was successfully sent.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_report
      @job_report = JobReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_report_params
      params.require(:job_report).permit(:job_id, :user_id, :customer_id, :job, :customer, :user, :serial_number, :service_date, :previous_date, :clean_air, :manual_gas, :gas_level, :total_count, :download, :raw_reading, :comment, :manual_gas_two, :manual_gas_final, :calibration_factor, :gas_replaced, :consumables_invoice_number, :calibration_successful, :attachment)
    end
end
