class CreatePins < ActiveRecord::Migration
  def change
   create_table :pins do |t|
      t.string :description
      t.belongs_to :user, index: true
      t.belongs_to :comment, index: true
      t.timestamps
    end
  end
end
