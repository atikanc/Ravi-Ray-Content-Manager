class CreateDisplayLines < ActiveRecord::Migration[6.1]
  def change
    create_table :display_lines do |t|
      t.belongs_to :Project
      t.belongs_to :Contribution
      t.string :ComponentContributed
      t.date :ComponentStartDate
      t.date :ComponentEndDate

      t.timestamps
    end
  end
end
