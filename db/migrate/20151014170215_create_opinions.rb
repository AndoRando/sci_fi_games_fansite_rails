class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.column :title, :string
      t.column :content, :string
      t.column :contribution_id, :integer

      t.timestamps
    end
  end
end
