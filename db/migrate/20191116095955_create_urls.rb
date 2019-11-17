class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :url
      t.boolean :processed
      t.string :last_response_status
      t.timestamps
    end
  end
end
