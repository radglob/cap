class Event < ApplicationRecord
  validates :name, :start_time, :end_time, presence: true
  validates :start_time, comparison: { less_than_or_equal_to: :end_time }
end
