class CreateDoiRequests < ActiveRecord::Migration
  def change
    create_table :doi_requests do |t|
      t.string :asset_type, default: "Collection"
      t.string :asset_id
      t.string :doi, default: "doi:pending"

      t.timestamps
    end
    add_index :doi_requests, :doi, unique: true
  end
end
