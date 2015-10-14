class DefaultRatingForContribution < ActiveRecord::Migration
  def change
    change_column :contributions, :rating_total, :integer, :default => 0
    change_column :contributions, :rating_count, :integer, :default => 0
  end
end
