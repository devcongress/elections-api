class FixColumnOnCandidateModel < ActiveRecord::Migration[5.0]
  def change
    change_column :candidates, :is_presidential_candidate, :boolean, default: false
  end
end
