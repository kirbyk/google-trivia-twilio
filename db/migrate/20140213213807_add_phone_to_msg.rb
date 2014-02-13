class AddPhoneToMsg < ActiveRecord::Migration
  def up
    add_column :msgs, :phone, :string
  end

  def down
    remove_column :msgs, :phone
  end
end
