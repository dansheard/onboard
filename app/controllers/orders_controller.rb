class OrdersController < ApplicationController
  # make sure we're logged in
  before_action :make_sure_logged_in

  def new
    # booking form
    # I need to find the room we're making the booking on
    @room = Room.find(params[:room_id])
    # because the room has "has_many :orders"
    @order = @room.orders.new
    # which person is booking the room?
    @order.user = current_user
  end

  def create
    # actually process a booking
    @room = Room.find(params[:room_id])
    @order = @room.orders.new(order_params)
    @order.user = current_user

    if @order.save
      
      # charge the user who's booked the room
      Stripe::Charge.create(
        amount: @room.price_in_pence, 
        currency: "gbp",
        card: @order.stripe_token, 
        description: "Order number #{@order.id}"
      )

      # subscriptions
      # Stripe::Customer.create(
      #   description: "Order number #{@order.id}",
      #   card: @order.stripe_token,
      #   plan: "gold"
      # )
      
      # to send out a new order email
      OrderMailer.new_order(@order).deliver

      flash[:success] = "Your room has been booked"
      redirect_to room_path(@room)
    else
      flash[:error] = "Payment unsuccessful"
      render "new"
    end
  end

  def order_params
    params.require(:order).permit(:stripe_token)
  end




end
