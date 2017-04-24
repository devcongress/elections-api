class AddIndexToYearOnElections < ActiveRecord::Migration[5.0]
  def change
    add_index :elections, :year, unique: true
  end
end
