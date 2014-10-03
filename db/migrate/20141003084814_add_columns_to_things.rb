class AddColumnsToThings < ActiveRecord::Migration
  def change
    add_column :things, :route, :string
    add_column :things, :value, :text
  end
end
