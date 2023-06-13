class Task < ApplicationRecord
  enum priority: { low: 1, medium: 2, high: 3 }

  belongs_to :priority, optional: true
  belongs_to :category, optional: true
  belongs_to :label, optional: true
  belongs_to :goal, optional: true

  has_many :groups
  has_many :users, through: :groups

  scope :not_completed, -> { where(completed: false)}
  scope :not_completed_with_priority, ->(priority) {
    where(completed: false, priority_id: priority)
  }
end
