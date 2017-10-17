require 'rails_helper'

describe "User deletes existing job" do
  scenario "a user can delete a job" do
    category = Category.create!(title: "Consulting")
    company = Company.create(name: "ESPN")
    job = Job.create!(title: "Q&A", description: "Testing",
                      level_of_interest: "50", city: "Colorado Springs",
                      company: company, category: category)

    visit company_job_path(company, job)

    click_on "Delete"

    expect(page).to have_content("Q&A at ESPN was successfully deleted!")
  end
end
