class AddNameToMsg < ActiveRecord::Migration
  def up
    add_column :msgs, :name, :string
  end

  def down
    remove_column :msgs, :name
  end
end
