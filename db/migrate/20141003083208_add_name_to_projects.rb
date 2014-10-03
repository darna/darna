class AddNameToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :name, :String
  end
end
