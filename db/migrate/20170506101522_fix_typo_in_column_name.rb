class FixTypoInColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :candidates, :highest_qualitfication, :highest_qualification
  end
end
