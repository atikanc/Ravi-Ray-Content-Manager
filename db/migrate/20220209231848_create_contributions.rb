class CreateContributions < ActiveRecord::Migration[6.1]
  def change
    create_table :contributions do |t|
      t.string :ContributionType

      t.timestamps
    end
  end
end
