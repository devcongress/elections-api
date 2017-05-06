class Candidate < ApplicationRecord
  belongs_to :political_party, required: false
  belongs_to :election
  # belongs_to :constituency

  enum sex: { female: 'fem', male: 'mal' }

  validate :is_older_than_18
  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :date_of_birth, presence: true
  validates :is_presidential_candidate, presence: true

  with_options if: :is_presidential_candidate? do |candidate|
    # candidate.validates :constituency, :presence
    candidate.validate :is_older_than_40 
  end

  private

  def is_older_than_18
    if (date_of_birth + 18.years) > Date.today
      errors.add(:date_of_birth, "candidate is not old enough")
    end
  end

  def is_older_than_40
    if (date_of_birth + 40.years) > Date.today
      errors.add(:date_of_birth, "presidential candiate is not old enough")
    end
  end
end
