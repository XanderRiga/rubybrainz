# frozen_string_literal: true

require 'rubybrainz/entities/artist'
require 'rubybrainz/transforms/json_to_area'

module Rubybrainz
  module Transforms
    # Convert response json to an artist
    class JsonToArtist
      def call(json_artist:)
        Rubybrainz::Entities::Artist.new(
          id: json_artist['id'],
          name: json_artist['name'],
          sort_name: json_artist['sort-name'],
          type: json_artist['type'],
          type_id: json_artist['type-id'],
          gender: json_artist['gender'],
          country: json_artist['country'],
          area: json_to_area.call(json_area: json_artist['area']),
          begin_area: json_to_area.call(json_area: json_artist['begin-area'])
        )
      end

      private

      def json_to_area
        @json_to_area ||= Rubybrainz::Transforms::JsonToArea.new
      end
    end
  end
end
