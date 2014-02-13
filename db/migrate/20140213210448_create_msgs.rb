class CreateMsgs < ActiveRecord::Migration
  def up
    create_table :msgs do |t|
      t.text :body
      t.timestamps
    end
  end

  def down
    drop_table :msgs
  end
end
