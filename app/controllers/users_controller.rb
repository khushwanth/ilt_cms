class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]
    def index
        @users = User.all
    end

    def edit
    end

    def update

    end

    def show 

    end

    def destroy
        @user.destroy
        respond_to do |format|
            format.html { redirect_to members_path, notice: 'User was successfully destroyed.' }
            format.json { head :no_content }
          end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :current_password, :designation, :phone, :address)
    end
end