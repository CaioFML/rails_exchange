require 'rails_helper'

RSpec.describe "Exchange Currency Process", type: :system, js: true do
  before { visit '/' }

  it "shows exchange value" do
    within("#exchange_form") do
      select('USD', from: 'source_currency')
      select('BRL', from: 'target_currency')
      expect(page).to have_field('result', placeholder: 'Resultado')

      fill_in 'amount', with: rand(1..9999)
    end

    expect(page.find_field("result").value).to be_present
  end

  it "shows exchange value to BTC" do
    within("#exchange_form") do
      select('BRL', from: 'source_currency')
      select('BTC', from: 'target_currency')
      expect(page).to have_field('result', placeholder: 'Resultado')

      fill_in 'amount', with: rand(1..9999)
    end

    expect(page.find_field("result").value).to be_present
  end

  it "changes between currency" do
    within("#exchange_form") do
      select('USD', from: 'source_currency')
      select('BRL', from: 'target_currency')
      expect(page).to have_field('result', placeholder: 'Resultado')
    end

    click_button "INVERTER MOEDAS"

    expect(page.find_field("source_currency").value).to eq "BRL"
    expect(page.find_field("target_currency").value).to eq "USD"
  end
end
