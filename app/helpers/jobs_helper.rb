module JobsHelper
  def options_for_jobs(jobs)
    options = []

    jobs.each do |job|
      options << [
        "#{job.id} | #{job.scheduled_date} | #{job.customer&.business_name}",
        job.id
      ]
    end

    options
  end
end
