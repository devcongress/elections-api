class AddColumnConsituencyIdToCandidate < ActiveRecord::Migration[5.0]
  def change
    add_reference :candidates, :constituency, foreign_key: true, type: :uuid
  end
end
