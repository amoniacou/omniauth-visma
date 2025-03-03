# OmniAuth VismaEaccounting

This gem contains the unofficial Visma eAccounting strategy for OmniAuth.

See the [authorization documentation](https://developer.vismaonline.com/#eAccountingApiAuthorization) for Visma eAccounting.

For more information about the API see https://developer.vismaonline.com/.

## Basic Usage

```ruby
use OmniAuth::Builder do
  provider "vismaeaccounting", ENV['VISMA_CLIENT_ID'], ENV['VISMA_CLIENT_SECRET'], scope: 'offline_access ea:api'
end
```

## Refreshing the access token

The retrieved ```access_token``` expires in one hour. So you need to retrieve a new token when it expires. You can do so using the ```refresh!``` method in OmniAuth. You will retrieve all new tokens so make sure you save both the ```access_token``` and ```refresh_token```.

Example:

```ruby
if Time.at( visma_access_token_expires_at ).past?
  oauth = OmniAuth::Strategies::VismaEaccounting.new(nil, {
    client_id: ENV['VISMA_CLIENT_ID'],
    client_secret: ENV['VISMA_CLIENT_SECRET']
  }
  token = OAuth2::AccessToken.new(
    oauth.client,
    visma_access_token,
    { refresh_token: visma_refresh_token }
  )
  new_tokens = token.refresh!
end
```

You can then use the new ```access_token``` and when it expires you can use the new ```refresh_token``` to gain a new one.

## Credits

Based on [omniauth-37signals](https://github.com/tallgreentree/omniauth-37signals) by [Will Barrett](https://github.com/willbarrett).

## License

Copyright (c) 2017 by Espen Antonsen. [MIT License](LICENSE)
Copyright (c) 2025 by Amoniac OU. [MIT License](LICENSE)