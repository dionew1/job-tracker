require 'rails_helper'

describe "user sees a comment" do
  scenario "a user sees a comment for a specific job" do
    category = Category.create!(title: "Consulting")
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70,
                                city: "Denver", category: category)

    job.comments.create!(content: "Submitted Resume")

    visit company_job_path(company, job)

    expect(page).to have_content("Submitted Resume")
  end
end
