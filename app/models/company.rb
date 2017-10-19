class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many  :jobs, dependent: :destroy
  has_many  :contacts, dependent: :destroy


  def company_job_interest
    jobs.map do |job|
      job.level_of_interest
    end
  end
end
