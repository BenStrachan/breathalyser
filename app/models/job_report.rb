class JobReport < ApplicationRecord
  belongs_to :job
  belongs_to :user, optional: true
  belongs_to :customer, optional: true
end
