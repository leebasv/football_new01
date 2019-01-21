require "rails_helper"
require "shoulda/matchers"

RSpec.describe User, type: :model do
  context "should have columns" do
    it {is_expected.to have_db_column(:name).of_type(:string)}
    it {is_expected.to have_db_column(:money).of_type(:float)}
    it {is_expected.to have_db_column(:created_at).of_type(:datetime)}
    it {is_expected.to have_db_column(:updated_at).of_type(:datetime)}
    it {is_expected.to have_db_column(:email).of_type(:string)}
    it {is_expected.to have_db_column(:admin).of_type :boolean}
  end

  context "associations" do
    it {is_expected.to have_many(:notifications).dependent(:destroy)}
    it {is_expected.to have_many(:score_bets).dependent(:destroy)}
    it {is_expected.to have_many(:comments).dependent(:destroy)}
  end

  context "validate presence and length" do
    it {is_expected.to validate_presence_of(:name)
      .with_message(I18n.t("activerecord.errors.models.user.name.blank"))}
    it {is_expected.to validate_length_of(:name).is_at_most(50)}
    it {is_expected.to validate_presence_of(:email)
      .with_message(I18n.t("activerecord.errors.models.user.email.blank"))}
    it {is_expected.to validate_length_of(:email).is_at_most(255)}
  end

  context "has valid factory" do
    let(:user) {FactoryBot.build(:user)}
    it {is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity}
    it {expect(user.email).to match(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)}
  end
end
