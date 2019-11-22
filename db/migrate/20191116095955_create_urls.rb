class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :url
      t.boolean :processed
      t.integer :processing_time
      t.string :response_http_status
      t.boolean :success, default: false
      t.timestamps
    end

    add_index :urls, :processed
    add_index :urls, :updated_at
  end
end
