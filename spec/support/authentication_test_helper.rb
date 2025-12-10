# frozen_string_literal: true

# Helper for setting up authenticated users with proper module access
module AuthenticationTestHelper
  # Creates a user with access to a specific system module
  def create_user_with_module_access(role:, module_name:)
    user = create(:user, role)
    system_module = SystemModule.find_or_create_by!(name: module_name, user: user)
    create(:system_module_user, user: user, system_module: system_module)
    user
  end

  # Creates an admin user with full access
  def create_admin_user(module_name: "collect")
    user = create(:user, :admin)
    system_module = SystemModule.find_or_create_by!(name: module_name, user: user)
    create(:system_module_user, user: user, system_module: system_module)
    user
  end

  # Returns auth headers for a user
  def auth_headers_for(user)
    access_token, _refresh_token = jwt_and_refresh_token(user, "user")
    { "Authorization" => "Bearer #{access_token}" }
  end
end

RSpec.configure do |config|
  config.include AuthenticationTestHelper, type: :request
end
