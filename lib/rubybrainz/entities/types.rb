# frozen_string_literal: true

require 'dry-types'

module Rubybrainz
  module Entities
    # Our base types so we don't have to repeat this all over our data classes
    module Types
      include Dry.Types()
    end
  end
end
