# frozen_string_literal: true

DeviseTokenAuth.setup do |config|
  config.token_cost = Rails.env.test? ? 4 : 10

  # Makes it possible to change the headers names
  # config.headers_names = {:'access-token' => 'access-token',
  #                        :'client' => 'client',
  #                        :'expiry' => 'expiry',
  #                        :'uid' => 'uid',
  #                        :'token-type' => 'token-type' }
end
