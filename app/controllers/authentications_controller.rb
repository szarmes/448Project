class AuthenticationsController < ApplicationController
  before_action :set_authentication, only: [:show, :edit, :update, :destroy]

  # GET /authentications
  # GET /authentications.json
  def index
    @authentications = current_user.authentications if current_user
    @user = current_user
  end

  # GET /authentications/1
  # GET /authentications/1.json
  def show
  end

  # GET /authentications/new
  def new
    @authentication = Authentication.new
  end

  # GET /authentications/1/edit
  def edit
  end

  # POST /authentications
  # POST /authentications.json
  def oldcreate
    @authentication = Authentication.new(authentication_params)

    respond_to do |format|
      if @authentication.save
        format.html { redirect_to @authentication, notice: 'Authentication was successfully created.' }
        format.json { render action: 'show', status: :created, location: @authentication }
      else
        format.html { render action: 'new' }
        format.json { render json: @authentication.errors, status: :unprocessable_entity }
      end
    end
  end

def create

  omniauth = request.env["omniauth.auth"]
  authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
  if authentication
    @user = User.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    flash[:notice] = "Signed in successfully."
    sign_in_and_redirect(@user, authentication.user)
  elsif user_signed_in?
    current_user.authentications.create(:provider => omniauth['provider'], :uid => omniauth['uid'])
    @t = Authentication.create(:provider => omniauth['provider'], :uid => omniauth['uid'])
    @t.save
    current_user.uid = omniauth['uid']
    current_user.provider = omniauth['provider']
    current_user.save
    flash[:notice] = "Authentication successful! You can now log in with Facebook."
    redirect_to edit_user_registration_path(current_user)
  else
    user = User.new
    user.apply_omniauth(omniauth)
    if user.save
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, user)
    else
      session[:omniauth] = omniauth.except('extra')
      redirect_to new_user_registration_url(:fname => omniauth.info.first_name, :lname =>  omniauth.info.last_name,
        :email => omniauth.info.email, :uid => omniauth.uid, :provider =>omniauth.provider)
    end
  end
end

  # PATCH/PUT /authentications/1
  # PATCH/PUT /authentications/1.json
  def update
    respond_to do |format|
      if @authentication.update(authentication_params)
        format.html { redirect_to @authentication, notice: 'Authentication was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @authentication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authentications/1
  # DELETE /authentications/1.json
  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_authentication
      @authentication = Authentication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def authentication_params
      params.require(:authentication).permit(:user_id, :provider, :uid, :index, :create, :destroy)
    end
end
