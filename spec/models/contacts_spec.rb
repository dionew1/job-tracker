require 'rails_helper'

describe Contact do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid wihtout a name" do
        contact = Contact.new(position: "HR", email: "hrep@woot.com")
        expect(contact).to be_invalid
      end

      it "is invalid wihtout a position" do
        contact = Contact.new(name: "Ena", email: "hrep@woot.com")
        expect(contact).to be_invalid
      end

      it "is invalid wihtout an email" do
        contact = Contact.new(name: "Ben", position: "HR")
        expect(contact).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        company = Company.create!(name: "Woot!")
        contact = company.contacts.create!(name: "Ken", position: "HR", email: "hrep@woot.com")
        expect(contact).to be_valid
      end
    end
  end
  describe "relationships" do
    it "belongs_to a company" do
      company = Company.create!(name: "Woot!")
      contact = company.contacts.create!(name: "Ken", position: "HR", email: "hrep@woot.com")
      expect(contact).to respond_to(:company)
    end
  end
end
