class CreateDisplayLines < ActiveRecord::Migration[6.1]
  def change
    create_table :display_lines do |t|
      t.string :ComponentContributed
      t.date :ComponentStartDate
      t.date :ComponentEndDate

      t.belongs_to :contributions
      t.belongs_to :projects

      t.timestamps
    end
  end
end
