class AddAttachmentUrlToPins < ActiveRecord::Migration
  def self.up
    change_table :pins do |t|
      t.attachment :url
    end
  end

  def self.down
    remove_attachment :pins, :url
  end
end
