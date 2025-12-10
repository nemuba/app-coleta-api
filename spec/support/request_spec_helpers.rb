# frozen_string_literal: true

# Helper methods for API request specs
module RequestSpecHelpers
  def json_response
    JSON.parse(response.body, symbolize_names: true)
  end
end
