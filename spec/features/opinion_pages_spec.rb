require 'rails_helper'

describe "the add an opinion process" do
  it "adds a new opinion" do
    halo = Contribution.create(name: "Halo", content: "Fun sci-fi shooter.", rating_total: 0, rating_count: 0, subgenre: "Shooter")
    visit contribution_path(halo)
    click_on "Add yours"
    fill_in "Title", :with => "It stinks"
    fill_in "Content", :with => "No seriously. It's bad"
    click_on "Create Opinion"
    expect(page).to have_content "It stinks"
  end

  it "gives errors when required info isn't provided" do
    halo = Contribution.create(name: "Halo", content: "Fun sci-fi shooter.", rating_total: 0, rating_count: 0, subgenre: "Shooter")
    visit contribution_path(halo)
    click_on "Add yours"
    click_on "Create Opinion"
    expect(page).to have_content "Please fix"
  end
end


describe "the opinion deletion process" do
  it "deletes an opinion" do
    halo = Contribution.create(name: "Halo", content: "Fun sci-fi shooter.", rating_total: 0, rating_count: 0, subgenre: "Shooter")
    test_opinion = Opinion.create(title: "Awesome", content: "Seriously Awesome", contribution_id: halo.id)
    visit contribution_path(halo)
    click_on "Remove"
    expect(page).not_to have_content "Awesome"
  end
end
