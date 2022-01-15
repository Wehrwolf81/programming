class RenameIntoruductionColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :intoruduction, :introduction
  end
end
