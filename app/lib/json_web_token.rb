class JsonWebToken
  # Secret to encode/decode the token
  HMAC_SECRET = Rails.application.secrets.secret_key_base

  # Set a signed token to expirer 24 hours from now using Rails secret key
  def self.encode(payload, expiration = 24.hours.from_now)
    payload[:exp] = expiration.to_i
    JWT.encode(payload, HMAC_SECRET)
  end

  # Decode the token or throw an ExpiredSignature exception for the application to catch
  def self.decode(token)
    # The payload is the first index in the decoded Array
    body = JWT.decode(token, HMAC_SECRET)[0]
    HashWithIndifferentAccess.new(body)
  rescue JWT::ExpiredSignature, JWT::VerificationError => e
    raise(ExceptionHandler::ExpiredSignature, e.message)
  end
end
