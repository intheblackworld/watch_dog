class AddAttachmentImageToInstalls < ActiveRecord::Migration
  def self.up
    change_table :installs do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :installs, :image
  end
end
