class AddAttachmentPathToPins < ActiveRecord::Migration
  def self.up
    change_table :pins do |t|
      t.attachment :path
    end
  end

  def self.down
    remove_attachment :pins, :path
  end
end
