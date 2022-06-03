class UsersController < ApplicationController
  def show
    @pets = current_user.pets
    authorize @pets
    @bookings = current_user.bookings
    @pet = Pet.new
    authorize @pet
  end
end
