class UsersController < ApplicationController

def show
  @user = User.find(params[:id])
  @prototypes = @user.prototypes
  @nickname = @user.name
  @profile = @user.profile
  @position = @user.position
  @occupation = @user.occupation
end
end