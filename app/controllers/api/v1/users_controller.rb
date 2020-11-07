# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController

  before_action :authenticate_user!, only: :who_am_i

  def sign_up
    @user = SignUpUser.call(user_params[:email], user_params[:password])
    if @user
      if CreateUserRelation.call(user_params, @user)
        render json: ::UserBlueprinter.render(@user)
      else
        head :unprocessable_entity
      end
    else
      render json: { error: { message: 'Email has already been taken. Choose another!' } }, status: 422
    end

  end

  def login
    @user = LogInUser.call(user_params)
    return head :unprocessable_entity unless @user

    render json: ::UserBlueprinter.render(@user, view: :who_am_i)
  end

  def who_am_i
    render json: ::UserBlueprinter.render(@user, view: :who_am_i)
  end

  private

  def user_params
    params['user']
  end


end
