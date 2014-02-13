class AddUserTable < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.text :phone
      t.text :name
      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
