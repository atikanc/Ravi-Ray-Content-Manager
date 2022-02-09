class CreateTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :types do |t|
      t.string :TypeName

      t.timestamps
    end
  end
end
