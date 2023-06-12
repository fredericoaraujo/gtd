class Task < ApplicationRecord
  belongs_to :priority
  belongs_to :category
  belongs_to :label
  belongs_to :goal
end
