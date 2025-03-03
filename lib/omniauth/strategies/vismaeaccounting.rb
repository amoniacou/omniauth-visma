# frozen_string_literal: true

require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Vismaeaccounting < OmniAuth::Strategies::OAuth2
      option :name, 'vismaeaccounting'
      option :client_options, {
        site: 'https://eaccountingapi.vismaonline.com/v2/',
        authorize_url: 'https://identity.vismaonline.com/connect/authorize',
        token_url: 'https://identity.vismaonline.com/connect/token'
      }

      option :authorize_options, %i[prompt acr_values state redirect_uri scope]

      info do
        {
          name: raw_info['Name'],
          email: raw_info['Email']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      credentials do
        hash = { 'token' => access_token.token }
        hash.merge!('refresh_token' => access_token.refresh_token) if access_token.refresh_token
        hash.merge!('expires_at' => access_token.expires_at) if access_token.expires?
        hash.merge!('expires' => access_token.expires?)
        hash
      end

      def raw_info
        @raw_info ||= access_token.get('/v2/companysettings').parsed
      end

      private

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
