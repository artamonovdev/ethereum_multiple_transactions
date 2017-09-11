require 'ethereum.rb'
class EthereumClient

  def initialize(ethereum_node)
    @client = Ethereum::HttpClient.new("http://#{ethereum_node}")
  end

  def transfer(sender_address, sender_password, recipient_address, contract_address, tokens_count_hex, gas_price=21000000000)
    gas_price_wei_hex = gas_price.to_s(16)
    gas_price_wei_hex = "0x#{gas_price_wei_hex}"

    # compile data
    function_signature = 'a9059cbb'
    prepared_recipient_address = recipient_address.gsub('0x', '').rjust(64, '0')
    prepared_token_count_hex = tokens_count_hex.rjust(64, '0')
    data = "0x#{function_signature}#{prepared_recipient_address}#{prepared_token_count_hex}"

    @client.personal_unlock_account(sender_address, sender_password, nil)

    response = @client.eth_send_transaction({from: sender_address,
                                             to: contract_address,
                                             gasPrice: gas_price_wei_hex,
                                             value: '0x0',
                                            data: data})
    response['result']
  end
end