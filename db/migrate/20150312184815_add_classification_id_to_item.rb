class AddClassificationIdToItem < ActiveRecord::Migration
  def change
      add_column :items, :classification_id, :integer
  end
end
