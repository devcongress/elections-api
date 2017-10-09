class CreateConstituencies < ActiveRecord::Migration[5.0]
  def change
    create_table :constituencies do |t|
      t.timestamps

      t.string :code, null: false
      t.string :name, null: false
      t.string :region, null: false
      t.integer :registered_voters, null: false
    end
  end
end
