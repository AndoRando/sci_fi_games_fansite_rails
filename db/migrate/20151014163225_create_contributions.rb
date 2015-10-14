class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.column :name, :string
      t.column :content, :string
      t.column :rating_total, :integer
      t.column :rating_count, :integer

      t.timestamps
    end
  end
end
