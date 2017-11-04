class Constituency < ApplicationRecord
  validates :code,              presence: true
  validates :name,              presence: true
  validates :region,            presence: true
  validates :registered_voters, presence: true,
                                numericality: { only_integer: true }
end
