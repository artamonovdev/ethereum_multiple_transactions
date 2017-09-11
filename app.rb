require_relative 'ethereum_client.rb'

# transactions config
transactions = [
    {
        address: '0x11e877009158b1eb18a0e8b56b0f65be69ed9275',
        amount: 13
    },
    {
        address: '0x901dcf1f29d76878e4e3ed5e724ef3f663c34629',
        amount: 3
    },
    {
        address: '0x11e877009158b1eb18a0e8b56b0f65be69ed9275',
        amount: 13
    },
    {
        address: '0x901dcf1f29d76878e4e3ed5e724ef3f663c34629',
        amount: 10
    }
]

# Ethereum node config
ethereum_node = 'localhost:41404'

# contract config
contract = {
    address: '',
    owner_address: '',
    owner_address_password: '',
    precision: 0
}

# gas config (25000000000 is 0.000000025 Ether (25 Gwei))
GAS_PRICE = 25000000000

ethereum_client = EthereumClient.new(ethereum_node)
contract_address = contract[:address]
contract_precision = contract[:precision]
owner_address = contract[:owner_address]
owner_address_password = contract[:owner_address_password]
for transaction in transactions
  to = transaction[:address]
  amount = transaction[:amount]
  amount = amount * (10**contract_precision)
  amount = amount.ceil
  amount_hex = amount.to_s(16)
  txid = ethereum_client.transfer(owner_address, owner_address_password, to, contract_address, amount_hex, GAS_PRICE)
  puts txid
end
