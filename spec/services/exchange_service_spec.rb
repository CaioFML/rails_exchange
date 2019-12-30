require 'spec_helper'
require 'json'

RSpec.describe ExchangeService do
  subject { ExchangeService.new("USD", "BRL", amount) }

  it 'exchange' do
    amount = rand(0..9999)
    res = subject.perform
    expect(res.is_a? Numeric).to eq true
    expect(res != 0 || amount == 0).to eq true
  end
end
