class Contact < ApplicationRecord
  validates :name, :position, :email, presence: true
  validates :name, uniqueness: true
  belongs_to :company
end
