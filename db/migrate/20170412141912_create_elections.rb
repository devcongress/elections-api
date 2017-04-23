class CreateElections < ActiveRecord::Migration[5.0]
  def change
    create_table :elections, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.integer :year,         null: false
      t.timestamp :started_at, null: false
      t.timestamp :ended_at,   null: false

      t.timestamp :created_at, null: false, default: -> { 'now()' }
      t.timestamp :updated_at, null: false, default: -> { 'now()' }
    end
  end
end
