class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.references :project, index: true

      t.timestamps
    end
  end
end
