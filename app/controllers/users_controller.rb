# frozen_string_literal: true

class UsersController < ApplicationController

  def sign_up
    @user = SignUpUser.call(user_params[:email], user_params[:password])
    if @user
      render json: ::UserBlueprinter.render(@user)
    else
      render json: { error: { message: 'Email has already been taken. Choose another!' } }, status: 422
    end

  end

  def user_params
    params['user']
  end

end
