module AuthorizationSpecHelper
  # def sign_in(user)
  #   post user_registration_path, params: { email: user.email, password: user.password}
  #   response.headers.slice('client', 'uid', 'token-type', 'access-token')
  # end
  def sign_in(user)
    post user_session_path, params: { email: user.email, password: user.password }
    response.headers.slice('client', 'uid', 'token-type', 'access-token')
  end
end
