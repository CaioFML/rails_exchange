class BitcoinService
  def self.process(source_currency, amount)
    url = "https://blockchain.info/tobtc?currency=#{source_currency}&value=#{amount}"
    response = RestClient.get url
    value = response.body.to_f

    value * amount.to_f
  end
end
