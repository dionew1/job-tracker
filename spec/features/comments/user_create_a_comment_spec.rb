require 'rails_helper'

describe "User creates a new comment" do
  scenario "a user can create comment" do
    category = Category.create!(title: "Consulting")
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70,
                                city: "Denver", category: category)

    visit company_job_path(company, job)

    fill_in "comment[content]", with: "Submitted Resume"

    click_on "Submit"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("Submitted Resume")
  end
end
