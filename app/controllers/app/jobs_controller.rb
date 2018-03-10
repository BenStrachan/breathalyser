class App::JobsController < App::BaseController
  layout 'admin'
  before_action :set_job, only: [:show, :edit, :update, :destroy, :repeat]

  def index
    @query = Job.includes(:user, :customer).ransack(params[:q])
    @jobs = @query.result(scheduled_date: :desc)
                                     .page(params[:page])
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new user_id: current_user.id
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        if params[:type] != 'none'
          clone_job = @job
          (1..params[:repeats].to_i).each do |index|
            clone_job = clone_job.dup
            case params[:type]
              when 'weekly'
                clone_job.scheduled_date = clone_job.scheduled_date.to_date + 1.week
                clone_job.completed_date = clone_job.completed_date.to_date + 1.week if clone_job.completed_date.try(:to_date)

              when 'monthly'
                clone_job.scheduled_date = clone_job.scheduled_date.to_date + 1.month
                clone_job.completed_date = clone_job.completed_date.to_date + 1.month if clone_job.completed_date.try(:to_date)

              when 'quarterly'
                clone_job.scheduled_date = clone_job.scheduled_date.to_date + 3.month
                clone_job.completed_date = clone_job.completed_date.to_date + 3.month if clone_job.completed_date.try(:to_date)

              when 'six monthly'
                clone_job.scheduled_date = clone_job.scheduled_date.to_date + 6.month
                clone_job.completed_date = clone_job.completed_date.to_date + 6.month if clone_job.completed_date.try(:to_date)

              when 'yearly'
                clone_job.scheduled_date = clone_job.scheduled_date.to_date + 1.year
                clone_job.completed_date = clone_job.completed_date.to_date + 1.year if clone_job.completed_date.try(:to_date)
            end
            clone_job.scheduled_date = clone_job.scheduled_date.to_date.strftime("%B %d %Y")
            clone_job.completed_date = clone_job.completed_date.to_date.strftime("%B %d %Y") if clone_job.completed_date.try(:to_date)
            clone_job.save
          end
        end

        format.html { redirect_to app_jobs_path, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to app_jobs_path, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to app_jobs_path, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:invoice_number, :user_id, :customer_id, :customer, :user, :title, :description, :scheduled_date, :completed_date, :status,
        :attachment)
    end
end
