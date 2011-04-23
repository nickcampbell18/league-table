class CreateClubs < ActiveRecord::Migration
  def self.up
    create_table :clubs do |t|
      t.string :name, :limit => 30
      t.string :slug, :limit => 30

      t.timestamps
    end
  end

  def self.down
    drop_table :clubs
  end
end
