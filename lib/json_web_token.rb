class JsonWebToken
  class << self
    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, ENV['SECRET_JWT_KEY'])
    end

    def decode(token)
      body = JWT.decode(token, ENV['SECRET_JWT_KEY'])[0]
      HashWithIndifferentAccess.new body
    rescue JWT::DecodeError
      nil
    end
  end
end