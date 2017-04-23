class AddIndexToNameOnPoliticalParties < ActiveRecord::Migration[5.0]
  def change
    add_index :political_parties, :name, unique: true
  end
end
