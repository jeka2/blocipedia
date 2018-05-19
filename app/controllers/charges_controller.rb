class ChargesController < ApplicationController

  def new
  @stripe_btn_data = {
    key: "#{ Rails.configuration.stripe[:publishable_key] }",
    description: "BigMoney Membership - #{current_user.email}",
    amount: 10_00
  }
end

  def create
    customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )

   charge = Stripe::Charge.create(
     customer: customer.id,
     amount: 10_00,
     description: "BigMoney Membership - #{current_user.email}",
     currency: 'usd'
   )

   flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
   current_user.premium!
   redirect_to root_path

   rescue Stripe::CardError => e
     flash[:alert] = e.message
     redirect_to new_charge_path
  end

end
