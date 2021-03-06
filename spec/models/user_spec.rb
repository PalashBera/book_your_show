require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe "active record columns" do
    it { should have_db_column(:first_name) }
    it { should have_db_column(:last_name) }
    it { should have_db_column(:email) }
    it { should have_db_column(:encrypted_password) }
    it { should have_db_column(:admin) }
    it { should have_db_column(:reset_password_token) }
    it { should have_db_column(:reset_password_sent_at) }
    it { should have_db_column(:remember_created_at) }
    it { should have_db_column(:sign_in_count) }
    it { should have_db_column(:current_sign_in_at) }
    it { should have_db_column(:last_sign_in_at) }
    it { should have_db_column(:current_sign_in_ip) }
    it { should have_db_column(:last_sign_in_ip) }
    it { should have_db_column(:confirmation_token) }
    it { should have_db_column(:confirmed_at) }
    it { should have_db_column(:confirmation_sent_at) }
    it { should have_db_column(:unconfirmed_email) }
    it { should have_db_column(:failed_attempts) }
    it { should have_db_column(:unlock_token) }
    it { should have_db_column(:locked_at) }
    it { should have_db_column(:created_at) }
    it { should have_db_column(:updated_at) }
  end

  describe "active record index" do
    it { should have_db_index(:confirmation_token) }
    it { should have_db_index(:email) }
    it { should have_db_index(:reset_password_token) }
    it { should have_db_index(:unlock_token) }
  end

  describe "attribute strip" do
    it { is_expected.to strip_attribute(:first_name).collapse_spaces }
    it { is_expected.to strip_attribute(:last_name).collapse_spaces }
    it { is_expected.to strip_attribute(:email).collapse_spaces }
  end

  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:first_name).is_at_most(100) }
    it { should validate_length_of(:last_name).is_at_most(100) }
    it { should validate_length_of(:email).is_at_most(100) }
    it { should allow_value(%w(true false)).for(:admin) }
  end

  describe "#full_name" do
    let(:user) { create(:user, first_name: "Palash", last_name: "Bera") }

    it "should return the full name of the user" do
      expect(user.full_name).to eq("Palash Bera")
    end
  end

  describe "#initial" do
    let(:user) { create(:user, first_name: "palash", last_name: "bera") }

    it "should return the initial of the user" do
      expect(user.initial).to eq("PB")
    end
  end
end
