class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.string :fullpath
      t.string :escfile
      t.string :video
      t.string :contenttype
      t.timestamps null: false
    end
  end
end
