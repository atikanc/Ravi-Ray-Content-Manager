class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :ProjectName
      t.text :ProjectLink
      t.string :ProjectOwner
      t.date :ProjectStart
      t.date :ProjectEnd
      t.text :ProjectDescription
      t.integer :TypeID

      t.timestamps
    end
  end
end
