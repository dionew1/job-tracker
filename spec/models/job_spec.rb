require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver",)
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, and company" do
        category = Category.create!(title: "Consulting")
        company = Company.new(name: "Turing")
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category: category)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo", city: "Denver")
      expect(job).to respond_to(:company)
    end
    it "belongs to a category" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo", city: "Denver")
      expect(job).to respond_to(:category)
    end
    it "has many comments" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo", city: "Denver")
      expect(job).to respond_to(:comments)
    end
  end

  describe "class methods" do
    it "can sort by city" do
      company = create(:company)
      category = create(:category)
      job = Job.create(title: "Software", level_of_interest: 70, description: "Wahooo",
                       city: "Denver", category: category, company: company)
      job = Job.create(title: "Software", level_of_interest: 70, description: "Wahooo",
                       city: "Boulder", category: category, company: company)
      expect(Job.sort_location.first.city).to eq("Boulder")
    end
    it "can sort by interest" do
      company = create(:company)
      category = create(:category)
      jobs = create_list(:job, 3, company: company, category: category)
      expect(Job.sort_interest.first.level_of_interest).to eq(jobs[0].level_of_interest)
    end
    it "can find by city" do
      company = create(:company)
      category = create(:category)
      job = Job.create(title: "Software", level_of_interest: 70, description: "Wahooo",
                       city: "Denver", category: category, company: company)
      job = Job.create(title: "Developer", level_of_interest: 70, description: "Wahooo",
                       city: "Boulder", category: category, company: company)
      expect(Job.find_by_city("Denver").count).to eq(1)
    end
    it "can group by interest" do
      company = create(:company)
      category = create(:category)
      job = Job.create(title: "Software", level_of_interest: 70, description: "Wahooo",
                       city: "Denver", category: category, company: company)
      job = Job.create(title: "Developer", level_of_interest: 70, description: "Wahooo",
                       city: "Boulder", category: category, company: company)
      job = Job.create(title: "Quality", level_of_interest: 60, description: "Wahooo",
                       city: "Boulder", category: category, company: company)
      expect(Job.group_by_interest[70]).to eq(2)
    end
  end
end
