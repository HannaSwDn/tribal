require 'rails_helper'

RSpec.describe Session, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :start_date }
		it { is_expected.to have_db_column :end_date }
		it { is_expected.to have_db_column :price }

  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :start_date }
  end

  describe 'Associations' do
    it { is_expected.to belong_to :price_table }
  end

  describe FactoryBot do
    it 'should have valid Factory' do
      expect(create(:session)).to be_valid
    end
  end
end
