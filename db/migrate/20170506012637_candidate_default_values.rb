class CandidateDefaultValues < ActiveRecord::Migration[5.0]
  def change
    change_column :candidates, :sex, :string, default: :mal
    change_column :candidates, :is_presidential_candidate, :boolean, default: :false
    change_column :candidates, :image_url, :string, null: true
  end
end
