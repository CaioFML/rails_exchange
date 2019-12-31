require 'rails_helper'

RSpec.describe 'Exchanges', type: :request do
  describe 'GET #index' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #convert' do
    let!(:amount) { rand(1..9999) }

    it 'returns http success' do
      get '/convert', params: {
                        source_currency: "USD",
                        target_currency: "BRL",
                        amount: amount
                      }
      expect(response).to have_http_status(200)
    end
  end
end
