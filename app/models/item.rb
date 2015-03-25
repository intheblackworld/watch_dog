class Item < ActiveRecord::Base
  belongs_to :classification
  has_attached_file :image, :styles => { :medium => "400x400>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  default_scope ->{ order('created_at DESC') }
end
