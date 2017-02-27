class UsersController < ApplicationController
	def create
		@user = User.new(user_params)

		if @user.save
			flash[:messages] = ["Your account has been created, please login!"]
			redirect_to "/main"
		else
			flash[:messages] = @user.errors.full_messages
			redirect_to "/main"
		end
	end

	def show
		if session[:user_id].to_s != params[:id].to_s
			redirect_to '/main'
		else
			@user = User.find(params[:id])
			@shoes_not_yet_sold = Shoe.where(:seller => @user, :buyer => nil)
			@shoes_sold = Shoe.where(:seller => @user).where.not(:buyer => nil)
			@shoes_purchased = Shoe.where(:buyer => @user)
			@total_purchases = 0
			@shoes_purchased.each do |shoe| 
				@total_purchases = @total_purchases + shoe.amount
			end

			@total_sales = 0
			@shoes_sold.each do |shoe|
				@total_sales = @total_sales + shoe.amount
			end
		end
	end


	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end


end
