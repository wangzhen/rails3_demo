class CreateSabroFirsts < ActiveRecord::Migration
  def self.up
    create_table :sabro_firsts do |t|
      t.string :name
      t.string :email
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :sabro_firsts
  end
end
