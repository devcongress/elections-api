class Candidate < ApplicationRecord
  belongs_to :political_party, required: false
  belongs_to :election
  belongs_to :constituency, required: false

  enum sex: { female: "fem", male: "mal" }

  validate :older_than
  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :date_of_birth, presence: true
  validates :constituency, presence: true, unless: :is_presidential_candidate?

  with_options if: :is_presidential_candidate? do |candidate|
    candidate.validate :older_than_40
  end

  private

    def older_than_40
      older_than(40)
    end

    def older_than(age = 18)
      if election.present?
        if (date_of_birth.year + age) > election.year
          errors.add(:date_of_birth, "candiate should be older than #{age}")
        end
      else
        errors.add(:election, "candidate should be in an election")
      end
    end
end
