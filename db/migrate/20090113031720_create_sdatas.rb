class CreateSdatas < ActiveRecord::Migration
  def self.up
    create_table :sdatas do |t|
      t.integer :stype
      t.integer :sid
      t.string :sname

      t.timestamps
    end
  end

  def self.down
    drop_table :sdatas
  end
end
