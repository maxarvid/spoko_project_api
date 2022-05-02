require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe "Products Table" do
    it { is_expected.to have_db_column(:size).of_type(:text) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
  end 

  describe "Validations" do
    it { is_expected.to validate_presence_of :size }
    it { is_expected.to validate_presence_of :name }
  
  end

  describe "Factory" do
    it "is expected to be valid" do
      expect(create(:product)).to be_valid
    end
  end



end
