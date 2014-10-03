class ChangeColumnFromThings < ActiveRecord::Migration
  def change
    rename_column :things, :route, :name
  end
end
