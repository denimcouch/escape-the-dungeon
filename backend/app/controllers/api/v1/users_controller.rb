class Api::V1::UsersController < ApplicationController

    def index
        users = User.all
        render json: users, only: [:id, :username, :password], include: {characters: { only: [:name, :role, :hp, :strength, :speed, :mind]}}
    end

    def show
        user = User.find(params[:id])
        render json: user, only: [:id, :username, :password], include: {characters: { only: [:name, :role, :hp, :strength, :speed, :mind]}}
    end

    def show_alt
        user = User.where({username: params[:username]})
        render json: user, only: [:id, :username, :password], include: {characters: { only: [:name, :role, :hp, :strength, :speed, :mind]}}
    end

    def create
        new_user = User.create(username: params[:username], password: params[:password])
        render json: new_user, only: [:id, :username, :password], include: {characters: { only: [:name, :role, :hp, :strength, :speed, :mind]}}
    end

end
