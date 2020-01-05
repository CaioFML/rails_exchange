require 'rails_helper'

RSpec.describe 'Exchanges', type: :request do
  describe 'GET #index' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #convert' do
    context "when target_currency is BTC" do
      it 'returns http success' do
        get '/convert', params: {
                        source_currency: "BRL",
                        target_currency: "BTC",
                        amount: 1
                      }

      expect(response).to have_http_status(200)
      expect(response.body).to eq({ "value": 0.00003309.to_f }.to_json)
      end
    end

    context "with any other target_currency" do
      it 'returns http success' do
        get '/convert', params: {
                          source_currency: "USD",
                          target_currency: "BRL",
                          amount: 1
                        }

        expect(response).to have_http_status(200)
        expect(response.body).to eq({ "value": 4.059 }.to_json)
      end
    end
  end
end
