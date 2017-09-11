### Goal

Transfer tokens with one wallet to many others Ethereum wallets.

#### Config

###### Destination addresses and tokens count:

```ruby
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
```

###### Address your Ethereum node for RPC connection:

```ruby
ethereum_node = 'localhost:41404'
```

###### Contract config:

`owner_address` and `owner_address_password` - address and password of a sender wallet

```ruby
contract = {
    address: '',
    owner_address: '',
    owner_address_password: '',
    precision: 0
}
```