class CreateDisplayLines < ActiveRecord::Migration[6.1]
  def change
    create_table :display_lines do |t|
      t.string :ComponentContributed
      t.date :ComponentStartDate
      t.date :ComponentEndDate
      t.integer :ContribProject
      t.integer :ContribType

      t.timestamps
    end
  end
end
