class PoliticalParty < ApplicationRecord
  validates :general_secretary, presence: true
  validates :name,              presence: true,
                                uniqueness: { case_sensitive: false }
  validates :slogan,            presence: true
  validates :chairman,          presence: true
  validates :colors,            presence: true
  validates :logo_url,          presence: true
end
