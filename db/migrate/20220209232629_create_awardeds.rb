class CreateAwardeds < ActiveRecord::Migration[6.1]
  def change
    create_table :awardeds do |t|
      t.string :AwardedDate

      t.timestamps
    end
  end
end
