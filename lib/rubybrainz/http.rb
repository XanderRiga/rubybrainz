# frozen_string_literal: true

require 'httparty'

module Rubybrainz
  # This is the class that will handle our request/response directly.
  class Http
    def get(url:, query:, limit: 25)
      HTTParty.get(
        url,
        headers: {
          'Accept' => 'application/json',
          'User-Agent' => 'rubybrainz'
        },
        query: {
          query: query,
          limit: limit
        }
      )
    end
  end
end
