class CreateMedications < ActiveRecord::Migration
  def self.up
    create_table :medications do |t|
      t.string :name
      t.date :started_date
      t.date :ended_date
      t.string :route
      t.string :strength
      t.string :dose
      t.string :frequency
      t.text :note
      t.integer :profile_id
      t.timestamps
    end
  end

  def self.down
    drop_table :medications
  end
end
