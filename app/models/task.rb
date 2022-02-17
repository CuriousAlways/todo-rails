class Task < ApplicationRecord
  enum status: { remaining: 0, completed: 1 }
  validates :title, :due_date, presence: true
  validates :status, inclusion: { in: statuses }
  
  scope :favourite_tasks, -> { where(favourite: true) }
end
