class CreatePoliticalParties < ActiveRecord::Migration[5.0]
  def change
    create_table :political_parties, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.text  :name,               null: false
      t.text  :slogan,             null: false
      t.text  :chairman,           null: false
      t.text  :general_secretary,  null: false
      t.text  :logo_url,           null: false
      t.text :colors, array: true, null: false

      t.timestamp :created_at, null: false, default: -> { 'now()' }
      t.timestamp :updated_at, null: false, default: -> { 'now()' }
    end
  end
end
