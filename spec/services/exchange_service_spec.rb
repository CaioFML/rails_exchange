require 'rails_helper'

RSpec.describe ExchangeService do
  describe "#perform" do
    subject(:perform) { ExchangeService.new("USD", "BRL", amount).perform }

    let(:amount) { rand(0..9999) }

    it 'exchanges' do
      expect(perform.is_a? Numeric).to eq true
      expect(perform != 0 || amount == 0).to eq true
    end
  end
end
