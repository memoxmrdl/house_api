require 'rails_helper'

RSpec.describe Property, type: :model do
  it { is_expected.to have_db_column(:id).of_type(:integer) }
  it { is_expected.to have_db_column(:house_type).of_type(:integer) }
  it { is_expected.to have_db_column(:address).of_type(:string) }
  it { is_expected.to have_db_column(:zipcode).of_type(:string) }
  it { is_expected.to have_db_column(:country).of_type(:string) }
  it { is_expected.to have_db_column(:notes).of_type(:text) }
  it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
  it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

  it { is_expected.to validate_presence_of(:house_type) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:address) }
  it { is_expected.to validate_presence_of(:zipcode) }
  it { is_expected.to validate_presence_of(:country) }

  it { is_expected.to validate_length_of(:title).is_at_least(15).is_at_most(45) }
  it { is_expected.to validate_length_of(:address).is_at_least(30).is_at_most(140) }
  it { is_expected.to validate_length_of(:notes).is_at_most(300) }
  it { is_expected.to validate_length_of(:country).is_equal_to(2) }
  it { is_expected.to define_enum_for(:house_type) }
  it { is_expected.to allow_value('99999', '11111').for(:zipcode) }
  it { is_expected.to validate_inclusion_of(:country).in_array(['mx', 'us', 'ca']) }
end
