class CreateCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :lastname, null: false
      t.string :firstname, null: false
      t.string :othernames

      t.date :date_of_birth
      t.string :sex, default: 'mal'

      t.string :highest_qualitfication
      t.string :occupation

      t.string :image_url, null: false

      t.boolean :is_presidential_candidate

      t.timestamp :created_at, null: false, default: -> { 'now()' }
      t.timestamp :updated_at, null: false, default: -> { 'now()' }
    end

    add_reference :candidates, :election, foreign_key: true, type: :uuid
    add_reference :candidates, :political_party, foreign_key: true, type: :uuid
  end
end
