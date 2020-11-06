class UserRole
  Manager = 'manager'
  Restaurant = 'restaurant'
  Admin = 'admin'
  Client = 'client'

  def self.allowed_values
    constants.map { |constant| const_get(constant) }
  end
end