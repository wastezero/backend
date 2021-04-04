class User < ApplicationRecord
  has_secure_password
  belongs_to :manager, optional: true
  belongs_to :restaurant, optional: true
  belongs_to :admin, optional: true
  belongs_to :client, optional: true

  def role
    if manager_id
      UserRole::Manager
    elsif restaurant_id
      UserRole::Restaurant
    elsif admin_id
      UserRole::Admin
    elsif client_id
      UserRole::Client
    end
  end

  def manager?
    manager.present?
  end

  def client?
    client.present?
  end

  def restaurant?
    restaurant.present?
  end

  def admin?
    admin.present?
  end

  def parent_user
    case role
    when UserRole::Manager
      manager
    when UserRole::Admin
      admin
    when UserRole::Client
      client
    when UserRole::Restaurant
      restaurant
    end
  end

  def name
    parent_user.name
  end


end