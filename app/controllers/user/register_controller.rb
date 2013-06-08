# -------------------------------------------------------------
# Register customer
# -------------------------------------------------------------
class User::RegisterController < FrontendController

  layout 'application-without-leftside'

  # -------------------------------------------------------------
  # Register form
  # GET /login
  # -------------------------------------------------------------
  def form
    @form = CustomerForm.new
  end

  # -------------------------------------------------------------
  # Create new user
  # GET /register
  # -------------------------------------------------------------
  def create
    @form = CustomerForm.new(params[:register_form])
    form_params = params[:register_form]

    if @form.valid?
      # Generate random password for new user
      password = form_params[:password]

      # Create customer
      @customer = Sap::Customer.new do |customer|
        # Create user
        customer.user = Sap::User.new do |user|
          # Email is login for customer
          user.login = @form.login
          # Set password and Salt
          user.salt = ApplicationHelper::get_random_string
          user.password = user.hash_password(password)
        end
        customer.name = @form.name
        customer.phone = @form.login
      end

      if @customer.save
        # Auth new user
        session[:user_id] = @customer.user.id
        #  Send conformation code
        sms_gate = SmsGate::SMSC.new
        @ret = sms_gate.send_sms(@form.login, 'Thank you for registration. your code is...',0,0,0,0, 'MartSoft')

        flash[:success] = 'Thank you for success registration'
        redirect_to root_path
      else
        flash[:error] = 'Errors! Please check inout data' + @customer.errors.to_hash.to_s
        render "form"
      end

    else
      flash.now[:error] = 'Errors!PLease input valid data'
      render "form"
    end
  end
end