class App::DashboardsController < App::BaseController
  def index
    @jobs_without_certificate = JobReport.joins(:job)
                                   .where("jobs.status = ?", Job::STATUS_COMPLETED)
                                   .where(sent_certificate_at: nil)
                                   .order(id: :desc)
                                   .limit(5)
                                    
    @job_without_invoice = Job.where(status: Job::STATUS_COMPLETED)
                              .where("invoice_number = ''")
                              .order(id: :desc).limit(5)
    @job_without_report = Job.includes(:job_reports)
                             .where(status: Job::STATUS_COMPLETED)
                             .where(job_reports: {id: nil})
                             .order(id: :desc)
                             .limit(5)
    @overdue_jobs = Job.where("status != ?", Job::STATUS_COMPLETED)
                       .where("scheduled_date <= ?", Date.current)
                       .order(scheduled_date: :desc)
                       .limit(5)
  end
end