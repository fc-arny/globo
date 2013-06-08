# -------------------------------------------------------------
# Create temporary user by Name and Phone
# -------------------------------------------------------------
class User::GuestController < ApplicationController
  # -------------------------------------------------------------
  #
  # -------------------------------------------------------------
  def create


    if form.valid?
      # Create customer
      customer = Sap::Customer.new do |cust|
        # Create user
        cust.user = Sap::User.new do |user|
          user.login = form.phone.to_s + '_' + Time.now.to_i.to_s + '@globomarket.ru'
          user.salt = ApplicationHelper::get_random_string()
          user.password = user.hash_password ApplicationHelper::get_random_string()
          user.is_temporary = true
        end
        cust.name = form.name
        cust.phone = form.phone
      end

      if customer.save
        session[:user_id] = @customer.user.id
      else
        t = 1
      end
    else

    end

    respond_to do |format|
      format.json {render json: 'ok'}
    end
  end
end