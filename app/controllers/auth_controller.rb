class AuthController < ApplicationController
  def login
    redirect_to dashboard_path if user_logged?
    @auth_path = Vk::PreAuthenticatorService.new.call
  end

  def auth
  end

  def fix_auth
    user, access_token = Vk::AuthenticatorService.new(params).call
    login_user(user)
    memorize_access_token(access_token)
    redirect_to dashboard_path
  end

  private

  def fixed_params
    malformed_uri = request.original_url
    proper_uri = malformed_uri.gsub(/#/, '?')
    CGI::parse(URI.parse(proper_uri).query)
  end
end