require 'rails_helper'

describe "User edits a job" do
  scenario "a user can edit a job" do
    category = create(:category)
    company = create(:company)
    job = create(:job, company: company, category: category)

    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"

    click_button "Update Job"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("Developer")
    expect(page).to have_content("So fun!")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
  end
end
