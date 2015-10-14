class AddSubgenreToContribution < ActiveRecord::Migration
  def change
    add_column :contributions, :subgenre, :string
  end
end
