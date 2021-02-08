require 'rails_helper'

RSpec.describe Order, type: :model do

  describe '#columns' do
    it { is_expected.to have_db_column(:total) }
    it { is_expected.to have_db_column(:subtotal) }
  end
end
