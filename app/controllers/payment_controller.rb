class PaymentController < ApplicationController
  def create
      # fetch the listing
      @listing = Listing.find(params[:listing_id])

      # do not update buyer before successfully having the payment through
      # # update the buyer
      # @listing.buyer_id = current_user.profile.id
      # @listing.save

      # fetch the root path
      if ENV['RAILS_ENV'] == "development"
        root_path = "http://localhost:3000"
      else
        root_path = ENV['ROOT_PATH']
      end

      # implement stripe code
      Stripe.api_key = Rails.application.credentials.dig(:stripe_api_key)
      session = Stripe::Checkout::Session.create({
        payment_method_types: ['card'],
        line_items: [{
          price_data: {
            currency: 'aud',
            product_data: {
              name: @listing.title,
            },
            unit_amount: @listing.price.to_i * 100,
          },
          quantity: 1,
        }],
        mode: 'payment',
        # These placeholder URLs will be replaced in a following step.
        # upon success redirect to listing show page, may be get the buyer to leave a review
        success_url: "#{root_path}/listings/#{@listing.id}?checkout=success",

        # if payment cancelled show a cancel msg
        cancel_url: "#{root_path}/payment/cancel",
      })
      redirect_to session.url
  end

  def cancel
    render file: 'public/404.html', layout: false, status: :not_found
  end
end
