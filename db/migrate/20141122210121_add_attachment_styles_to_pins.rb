class AddAttachmentStylesToPins < ActiveRecord::Migration
  def self.up
    change_table :pins do |t|
      t.attachment :styles
    end
  end

  def self.down
    remove_attachment :pins, :styles
  end
end
