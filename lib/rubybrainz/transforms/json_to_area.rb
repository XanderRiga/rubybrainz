# frozen_string_literal: true

require 'rubybrainz/entities/area'

module Rubybrainz
  module Transforms
    # Convert response json to an area
    class JsonToArea
      def call(json_area:)
        Rubybrainz::Entities::Area.new(
          id: json_area['id'],
          type: json_area['type'],
          type_id: json_area['type-id'],
          name: json_area['name'],
          sort_name: json_area['sort-name']
        )
      end
    end
  end
end
