class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :name
      t.string :description
      t.float :height
      t.float :width
      t.float :length

      t.timestamps
    end
  end
end
