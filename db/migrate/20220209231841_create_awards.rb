class CreateAwards < ActiveRecord::Migration[6.1]
  def change
    create_table :awards do |t|
      t.string :AwardName
      t.text :AwardLink
      t.date :AwardYear

      t.timestamps
    end
  end
end
