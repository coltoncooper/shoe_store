class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(:email => params[:email])
		if user
			if user.authenticate(params[:password])
				session[:user_id] = user.id
				redirect_to '/dashboard/'+user.id.to_s
			else
				flash[:messages] = ["Invalid Password"]
				redirect_to '/main'
			end
		else
			flash[:messages] = ['Please enter valid email and password']
			redirect_to '/main'
		end
				

	end

	def destroy
		session[:user_id] = nil
		flash[:messages] = ["You have successfully logged out"]
		redirect_to "/main"
	end
end
