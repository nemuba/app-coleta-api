# frozen_string_literal: true

require "rails_helper"

RSpec.describe User do
  # Shoulda Matchers - Associations
  describe "associations" do
    it { is_expected.to have_one(:profile).dependent(:destroy) }
    it { is_expected.to have_many(:system_module_users).dependent(:destroy) }
    it { is_expected.to have_many(:user_modules).through(:system_module_users).source(:system_module) }
    it { is_expected.to have_many(:products).dependent(:destroy) }
    it { is_expected.to have_many(:collects).dependent(:destroy) }
    it { is_expected.to have_many(:routes).dependent(:destroy) }
    it { is_expected.to have_many(:point_histories).dependent(:destroy) }
    it { is_expected.to have_one(:user_point).dependent(:destroy) }
    it { is_expected.to have_many(:product_user_histories).dependent(:destroy) }
  end

  # Shoulda Matchers - Validations
  describe "validations" do
    subject { build(:user, :business) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end

  # Shoulda Matchers - Enums
  describe "enums" do
    it { is_expected.to define_enum_for(:role).with_values(admin: 0, customer: 1, business: 2, collector: 3) }
  end

  # FactoryBot - Creating records
  describe "factory" do
    it "creates a valid user" do
      user = build(:user, :business)
      expect(user).to be_valid
    end

    it "creates an admin user with trait" do
      admin = build(:user, :admin)
      expect(admin.role).to eq("admin")
    end

    it "creates a collector user with trait" do
      collector = build(:user, :collector)
      expect(collector.role).to eq("collector")
    end
  end

  # Testing callbacks
  describe "callbacks" do
    context "when user is customer" do
      it "creates system_module_user after create" do
        user = create(:user, :customer)
        expect(user.system_module_users).to be_present
      end
    end

    context "when user is business" do
      it "does not create system_module_user after create" do
        user = create(:user, :business)
        expect(user.system_module_users).to be_empty
      end
    end
  end
end
