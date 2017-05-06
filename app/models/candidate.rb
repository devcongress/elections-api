class Candidate < ApplicationRecord
  belongs_to :political_party, required: false
  belongs_to :election
  # belongs_to :constituency

  enum sex: { female: 'fem', male: 'mal' }

  validate :is_older_than_18
  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :date_of_birth, presence: true

  with_options if: :is_presidential_candidate? do |candidate|
    # candidate.validates :constituency, :presence
    candidate.validate :is_older_than_40 
  end

  private

  def is_older_than_18
    if election.present?
      if (date_of_birth.year + 18) > election.year
        errors.add(:date_of_birth, "candidate is not old enough")
      end
    else
      errors.add(:election, "candidate should be in an election")
    end

  end

  def is_older_than_40
    if election.present?
      if (date_of_birth.year + 40) > election.year
        errors.add(:date_of_birth, "presidential candiate is not old enough")
      end
    else
      errors.add(:election, "candidate should be in an election")
    end
  end

end
