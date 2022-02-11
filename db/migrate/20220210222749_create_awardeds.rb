class CreateAwardeds < ActiveRecord::Migration[6.1]
  def change
    create_table :awardeds do |t|
      t.date :AwardedDate
      t.integer :AwardID
      t.integer :ProjectID

      t.belongs_to :awards
      t.belongs_to :projects

      t.timestamps
    end
  end
end
