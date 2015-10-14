require 'rails_helper'

describe "the add a contribution process" do
  it "adds a new contribution" do
    visit contributions_path
    click_on "New Contribution"
    fill_in "Name", :with => "Mass Effect (2008)"
    fill_in "Content", :with => "As the first human on the galactic stage, you must uncover the greatest threat to civilization. Your job is complicated by the very fact of your humanity, as no one trusts you and you need to find a way to convince everyone of the grave threat. You will travel across an expansive universe to piece the mystery together. As you discover and explore the uncharted edges of the galaxy, you come closer to an overwhelming truth - learning that the placid and serene universe you know is about to come to a violent end and that you may be the only person who can stop it!"
    fill_in "Subgenre", :with => "Shooter"
    click_on "Create Contribution"
    expect(page).to have_content "Mass Effect"
  end

  it "gives errors when required info isn't provided" do
    visit contributions_path
    click_on "New Contribution"
    click_on "Create Contribution"
    expect(page).to have_content "Please fix"
  end
end

describe "the edit a contribution process" do
  it "edits the details of a contribution" do
    halo = Contribution.create(name: "Halo", content: "Fun sci-fi shooter.", rating_total: 0, rating_count: 0, subgenre: "Shooter")
    visit contribution_path(halo)
    click_on "Edit"
    fill_in "Name", :with => "Mass Effect (2008)"
    fill_in "Content", :with => "As the first human on the galactic stage, you must uncover the greatest threat to civilization. Your job is complicated by the very fact of your humanity, as no one trusts you and you need to find a way to convince everyone of the grave threat. You will travel across an expansive universe to piece the mystery together. As you discover and explore the uncharted edges of the galaxy, you come closer to an overwhelming truth - learning that the placid and serene universe you know is about to come to a violent end and that you may be the only person who can stop it!"
    fill_in "Subgenre", :with => "Shooter"
    click_on "Update Contribution"
    expect(page).to have_content "Mass Effect (2008)"
  end

  it "gives errors when required info isn't provided" do
    halo = Contribution.create(name: "Halo", content: "Fun sci-fi shooter.", rating_total: 0, rating_count: 0, subgenre: "Shooter")
    visit contribution_path(halo)
    click_on "Edit"
    fill_in "Name", :with => ""
    fill_in "Content", :with => ""
    fill_in "Subgenre", :with => ""
    click_on "Update Contribution"
    expect(page).to have_content "Please fix"
  end
end

describe "the delete a contribution process" do
  it "deletes a contribution" do
    halo = Contribution.create(name: "Halo", content: "Fun sci-fi shooter.", rating_total: 0, rating_count: 0, subgenre: "Shooter")
    visit contributions_path
    click_on "Halo"
    click_on "Delete"
    expect(page).to_not have_content "Halo"
  end
end
