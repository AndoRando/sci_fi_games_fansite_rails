class Contribution < ActiveRecord::Base
  has_many :opinions
  validates_presence_of :name, :content, :rating_total, :rating_count, :subgenre

  def rate(rating)
    self.rating_total += rating
    self.rating_count += 1
    save
  end

  def rating
    rating_total / rating_count
  end
end
