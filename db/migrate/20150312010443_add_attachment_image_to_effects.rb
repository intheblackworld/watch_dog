class AddAttachmentImageToEffects < ActiveRecord::Migration
  def self.up
    change_table :effects do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :effects, :image
  end
end
