class CreatePets < ActiveRecord::Migration[7.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :animal
      t.date :dob
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
