# frozen_string_literal: true

require 'rubybrainz/entities/base'

module Rubybrainz
  module Entities
    module Request
      # This defines a request to search for an artist
      # Details for what these fields are can be found here: https://musicbrainz.org/doc/Search_Server
      class ArtistParameter < Base
        attribute :alias, Types::String.optional.default(nil)
        attribute :area, Types::String.optional.default(nil)
        attribute :arid, Types::String.optional.default(nil)
        attribute :artist, Types::String.optional.default(nil)
        attribute :artistaccent, Types::String.optional.default(nil)
        attribute :begin, Types::String.optional.default(nil)
        attribute :comment, Types::String.optional.default(nil)
        attribute :country, Types::String.optional.default(nil)
        attribute :end, Types::String.optional.default(nil)
        attribute :endarea, Types::String.optional.default(nil)
        attribute :ended, Types::String.optional.default(nil)
        attribute :gender, Types::String.optional.default(nil)
        attribute :ipi, Types::String.optional.default(nil)
        attribute :sortname, Types::String.optional.default(nil)
        attribute :tag, Types::String.optional.default(nil)
        attribute :type, Types::String.optional.default(nil)

        def query_string
          existing_variables = []
          to_h.each do |key, value|
            existing_variables << ("#{key}:#{value}") if value
          end

          existing_variables.join(' AND ')
        end
      end
    end
  end
end
