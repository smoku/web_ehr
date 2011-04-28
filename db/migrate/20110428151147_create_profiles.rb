class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :name
      t.date :birth_date
      t.string :blood_type
      t.integer :sex
      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
