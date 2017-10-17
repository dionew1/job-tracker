class Comment < ApplicationRecord
  validates  :content, presence: true, uniqueness: true
  validates  :job_id, presence: true
  belongs_to :job
end
