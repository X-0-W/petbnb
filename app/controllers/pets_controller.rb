class PetsController < ApplicationController
  before_action :find_pet, only: [:update, :edit, :destroy, :show]
  skip_before_action :authenticate_user!, only: [:show, :index, :map]

  def index
    @pets = policy_scope(Pet).order(created_at: :desc)
    if params[:query].present?
      @pets = Pet.where("species ILIKE ?", "%#{params[:query]}%")
    else
      @pets = Pet.all
    end
  end

  def map
    @pets = policy_scope(Pet).order(created_at: :desc)
    @pets = @pets.where if params[:species]
    @pets = # second filter
    @pets = # third filter
    @markers = @pets.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
        marker_info_window: render_to_string(partial: "marker_info_window", locals: { pet: pet }),
        image_url: pet.photos.first.url
      }
    end
  end

  def show
    authorize @pet
  end

  def new
    @pet = Pet.new
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params)
    authorize @pet
    @pet.user = current_user
    if @pet.save
      redirect_to pets_path
    else
      render :new
    end
  end

  def update
    authorize @pet
    @pet.update(pet_params)
  end

  def edit
    authorize @pet
  end

  def destroy
    authorize @pet
  end

  private

  def pet_params
    params.require(:pet).permit(:species, :name, :toilet_trained, :description, :price_per_day, :address, photos: [])
  end

  def find_pet
    @pet = Pet.find(params[:id])
  end
end
