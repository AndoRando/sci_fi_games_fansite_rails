require 'rails_helper'

describe Contribution do
  it { should validate_presence_of :name }
  it { should validate_presence_of :content }
  it { should validate_presence_of :rating_total }
  it { should validate_presence_of :rating_count }
  it { should validate_presence_of :subgenre }
  it { should have_many :opinions }

  describe 'Contribution#rate' do
    it 'increases the rating total and number of ratings' do
      test_contrib = Contribution.create(name: "Halo", content: "Fun sci-fi shooter.", rating_total: 0, rating_count: 0, subgenre: "Shooter")
      test_contrib.rate(4)
      expect(test_contrib.rating_total).to(eql(4))
      expect(test_contrib.rating_count).to(eql(1))
    end
  end

  describe 'Contribution#rating' do
    it 'shows the rating as an average of all ratings divided by number of ratings' do
      test_contrib = Contribution.create(name: "Halo", content: "Fun sci-fi shooter.", rating_total: 12, rating_count: 3, subgenre: "Strategy")
      expect(test_contrib.rating).to(eql(4))
    end
  end
end
