require 'rails_helper'

RSpec.describe Product, type: :model do

  describe '#columns' do
    it { is_expected.to have_db_column(:title) }
    it { is_expected.to have_db_column(:price) }
  end

end
