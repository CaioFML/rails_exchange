require 'rails_helper'

RSpec.describe BitcoinService do
  describe "#process" do
    subject { described_class.process("BRL", rand(0..9999)) }

    it "exchanges currency to BTC" do
      expect(subject != 0).to be_truthy
    end
  end
end
