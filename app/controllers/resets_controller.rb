class ResetsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:email])
		if user
			user.generate_password_reset_token!
			Reset.password_reset(user).deliver_now
			redirect_to login_path, notice: "Email sent to #{user.email}"
		else
			flash.now[:alert] = "We do not have a user with that email. Please try again."
			# take user back to the page to enter email to reset password
			render :new
		end
	end

	def edit
		@user = User.find_by(password_reset_token: params[:id])
		if @user
			# no need to write it out - this will render edit.html.erb for us
		else
			redirect_to login_path, alert: "Invalid password reset token"
		end
	end

	def update
		@user = User.find_by(password_reset_token: params[:id])
		if params[:user][:password].present?
			if @user && @user.update(user_params)
				@user.update(password_reset_token: nil)
				session[:user_id] = @user.id
				redirect_to login_path, flash: {success: "Password has been updated."}
			else
				flash.now[:notice] = "Password should be at least 8 characters."
				render :edit
			end
		else
			flash.now[:alert] = "Password reset token not found."
			render :edit
		end
	end

	private
		def user_params
			params.require(:user).permit(:password)
		end

end
