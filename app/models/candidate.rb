class Candidate < ApplicationRecord
  belongs_to :political_party, required: false
  belongs_to :election

  enum sex: { female: 'fem', male: 'mal' }

  # validates_presence_of :constituency, :if => Proc.new { |c| !c.is_presidential_candidate }

end
