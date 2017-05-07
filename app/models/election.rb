class Election < ApplicationRecord
  validate :started_at_cannot_be_later_than_ended_at

  validates :year,       presence: true,
                         uniqueness: true,
                         numericality: { greater_than_or_equal_to: 1992 }
  validates :started_at, presence: true
  validates :ended_at,   presence: true


  private

    def started_at_cannot_be_later_than_ended_at
      if started_at && ended_at
        if started_at >= ended_at
          errors.add(:started_at, "can't be later than ended at")
        end
      end
    end

    def started_at_cannot_be_in_the_future
      if started_at
        errors.add(:started_at, "can't be in the future") unless started_at < DateTime.now
      end
    end
end
