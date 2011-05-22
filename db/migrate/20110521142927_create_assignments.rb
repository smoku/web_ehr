class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|
      t.integer :profile_id
      t.integer :user_id
    end
  end

  def self.down
    drop_table :assignments
  end
end
