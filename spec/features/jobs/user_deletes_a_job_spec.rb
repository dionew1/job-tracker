require 'rails_helper'

describe "User deletes existing job" do
  scenario "a user can delete a company" do
    company = Company.create(name: "ESPN")
    Job.create!(title: "Q&A", description: "Testing", level_of_interest: "50", city: "Colorado Springs", company: company)

    visit company_job_path(company, job)

    within(".company_#{company.id}_job_#{job.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("Q&A was successfully deleted!")
  end
end
