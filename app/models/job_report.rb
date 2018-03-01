# == Schema Information
#
# Table name: job_reports
#
#  id            :integer          not null, primary key
#  job           :string
#  customer      :string
#  user          :string
#  serial_number :string
#  service_date  :string
#  previous_date :string
#  clean_air     :string
#  manual_gas    :string
#  gas_level     :string
#  total_count   :string
#  download      :string
#  raw_reading   :string
#  comment       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  job_id        :integer
#  user_id       :integer
#  customer_id   :integer
#

class JobReport < ApplicationRecord
  belongs_to :job
  belongs_to :user, optional: true
  belongs_to :customer, optional: true
end
