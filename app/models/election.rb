class Election < ApplicationRecord
  validates :year,       presence: true,
                         uniqueness: true,
                         numericality: { greater_than_or_equal_to: 1992 }
  validates :started_at, presence: true
  validates :ended_at,   presence: true
end
