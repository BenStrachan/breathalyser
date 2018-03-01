# == Schema Information
#
# Table name: jobs
#
#  id             :integer          not null, primary key
#  customer       :string
#  user           :string
#  title          :string
#  description    :string
#  scheduled_date :string
#  completed_date :string
#  status         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  customer_id    :integer
#  user_id        :integer
#

class Job < ApplicationRecord
  belongs_to :customer
  belongs_to :user, optional: true
end
