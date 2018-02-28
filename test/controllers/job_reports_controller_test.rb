require 'test_helper'

class JobReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_report = job_reports(:one)
  end

  test "should get index" do
    get job_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_job_report_url
    assert_response :success
  end

  test "should create job_report" do
    assert_difference('JobReport.count') do
      post job_reports_url, params: { job_report: { clean_air: @job_report.clean_air, comment: @job_report.comment, customer: @job_report.customer, download: @job_report.download, gas_level: @job_report.gas_level, job: @job_report.job, manual_gas: @job_report.manual_gas, previous_date: @job_report.previous_date, raw_reading: @job_report.raw_reading, serial_number: @job_report.serial_number, service_date: @job_report.service_date, total_count: @job_report.total_count, user: @job_report.user } }
    end

    assert_redirected_to job_report_url(JobReport.last)
  end

  test "should show job_report" do
    get job_report_url(@job_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_report_url(@job_report)
    assert_response :success
  end

  test "should update job_report" do
    patch job_report_url(@job_report), params: { job_report: { clean_air: @job_report.clean_air, comment: @job_report.comment, customer: @job_report.customer, download: @job_report.download, gas_level: @job_report.gas_level, job: @job_report.job, manual_gas: @job_report.manual_gas, previous_date: @job_report.previous_date, raw_reading: @job_report.raw_reading, serial_number: @job_report.serial_number, service_date: @job_report.service_date, total_count: @job_report.total_count, user: @job_report.user } }
    assert_redirected_to job_report_url(@job_report)
  end

  test "should destroy job_report" do
    assert_difference('JobReport.count', -1) do
      delete job_report_url(@job_report)
    end

    assert_redirected_to job_reports_url
  end
end
