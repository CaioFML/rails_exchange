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
      before do
        response = double
        allow(response).to receive(:body).and_return "0.00003309"
        allow(response).to receive(:code).and_return 200
        allow(RestClient).to receive(:get).and_return response
      end

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
      before do
        response = double
        allow(response).to receive(:body).and_return body.to_json
        allow(response).to receive(:code).and_return 200
        allow(RestClient).to receive(:get).and_return response
      end

      let(:body) do
        {
          "currency"=>[{"currency"=>"USD/BRL", "value"=>"4.059"}]
        }
      end

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
