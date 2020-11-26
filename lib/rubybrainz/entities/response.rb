# frozen_string_literal: true

require 'rubybrainz/entities/base'
require 'rubybrainz/entities/work'
require 'rubybrainz/entities/artist'

module Rubybrainz
  module Entities
    # This will be the object we return for all requests
    class Response < Base
      attribute :success, Types::Bool
      attribute :message, Types::String
      attribute :created, Types::JSON::DateTime.optional.default(nil)
      attribute :count, Types::Integer.optional.default(nil)
      attribute :offset, Types::Integer.optional.default(nil)
      attribute :works, Types::Array.of(Rubybrainz::Entities::Work).optional.default(nil)
      attribute :artists, Types::Array.of(Rubybrainz::Entities::Artist).optional.default(nil)
    end
  end
end
