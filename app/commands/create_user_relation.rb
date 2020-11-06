class CreateUserRelation
  include Callable

  def initialize(user_params, user)
    @user_params = user_params
    @user = user
  end

  def call
    if @user_params['branch_id']
      manager = Manager.create(params)
      @user.manager_id = manager.id
    elsif @user_params['description']
      restaurant = Restaurant.create(params)
      @user.restaurant_id = restaurant.id
    else
      client = Client.create(params)
      @user.client_id = client.id
    end
    @user.save!
  end

  private

  def params
    @user_params.except(:email, :password, :password_confirmation).permit!
  end


end