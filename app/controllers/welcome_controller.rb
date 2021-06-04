class WelcomeController < ApplicationController
  def index
    json_response({ msg: 'API Collect App' })
  end
end
