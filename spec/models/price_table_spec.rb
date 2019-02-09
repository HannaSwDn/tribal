require 'rails_helper'

RSpec.describe PriceTable, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :trainee_1 }
    it { is_expected.to have_db_column :trainee_3 }
    it { is_expected.to have_db_column :trainee_4 }
    it { is_expected.to have_db_column :trainee_5 }
    it { is_expected.to have_db_column :trainee_6 }
    it { is_expected.to have_db_column :trainee_7 }
    it { is_expected.to have_db_column :trainee_8 }
    it { is_expected.to have_db_column :price_point }
  end

  describe 'Validations' do
		it { is_expected.to validate_presence_of :trainee_1 }
    it { is_expected.to validate_presence_of :trainee_3 }
    it { is_expected.to validate_presence_of :trainee_4 }
    it { is_expected.to validate_presence_of :trainee_5 }
    it { is_expected.to validate_presence_of :trainee_6 }
    it { is_expected.to validate_presence_of :trainee_7 }
    it { is_expected.to validate_presence_of :trainee_8 }
		it { is_expected.to validate_presence_of :price_point }
  end

  describe 'Associations' do
    it { is_expected.to have_many :sessions }
  end

  describe FactoryBot do
    it 'should have valid Factory' do
      expect(create(:price_table)).to be_valid
    end
  end
end
