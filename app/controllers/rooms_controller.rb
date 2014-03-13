class RoomsController < ApplicationController
  def index
    # show a list of all the rooms
    @rooms = Room.all
  end

  def show
    # show a room
    @room = Room.find(params[:id])
  end

  def new
    # add a room form
    @room = Room.new
  end

  def create
    # enter the room into the database
    @room = Room.new(room_params)

    if @room.save
      flash[:success] = "Your room has been added"
      redirect_to room_path(@room)
    else
      render "new"
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])

    if @room.update(room_params)
      flash[:success] = "Your room has been updated"
      redirect_to room_path(@room)
    else
      render 'edit'
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:success] = "Your room has been deleted"
    redirect_to root_path
  end

  def room_params
    # this whitelists our form data
    params.require(:room).permit(:name, :address, :number_of_beds, :price_in_pence, :is_available)
  end
end
