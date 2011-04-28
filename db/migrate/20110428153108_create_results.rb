class CreateResults < ActiveRecord::Migration
  def self.up
    create_table :results do |t|
      t.string :name
      t.string :result
      t.string :units
      t.date :date
      t.text :note
      t.integer :profile_id
      t.timestamps
    end
  end

  def self.down
    drop_table :results
  end
end
