# frozen_string_literal: true

require 'rubybrainz/http'
require 'rubybrainz/constants/urls'

module Rubybrainz
  # The thing that should be called to actually hit MusicBrainz search API
  class Search
    def artist(artist_parameter:)
      client.get(url: Rubybrainz::Constants::Urls::ARTIST_URL, query: artist_parameter.query_string)
    end

    private

    def client
      @client ||= Rubybrainz::Http.new
    end
  end
end
