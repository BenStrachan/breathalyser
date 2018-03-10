# == Schema Information
#
# Table name: job_reports
#
#  id                         :integer          not null, primary key
#  job                        :string
#  customer                   :string
#  user                       :string
#  serial_number              :string
#  service_date               :string
#  previous_date              :string
#  clean_air                  :string
#  manual_gas                 :string
#  gas_level                  :string
#  total_count                :string
#  download                   :string
#  raw_reading                :string
#  comment                    :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  job_id                     :integer
#  user_id                    :integer
#  customer_id                :integer
#  manual_gas_two             :string
#  manual_gas_final           :string
#  calibration_factor         :string
#  gas_replaced               :string
#  consumables_invoice_number :string
#  calibration_successful     :string
#  attachment_file_name       :string
#  attachment_content_type    :string
#  attachment_file_size       :integer
#  attachment_updated_at      :datetime
#  sent_certificate_at        :datetime
#

require 'test_helper'

class JobReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
