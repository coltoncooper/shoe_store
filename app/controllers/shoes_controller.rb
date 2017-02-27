class ShoesController < ApplicationController

	def index
		@user = User.find(session[:user_id].to_i)
		@shoes_for_sale = Shoe.where(:buyer => nil)
	end

	def create
		@shoe = Shoe.new(shoe_params)
		@shoe.seller = User.find(session[:user_id].to_i)

		if @shoe.save
			redirect_to "/dashboard/"+session[:user_id].to_s
		else
			flash[:messages] = @shoe.errors.full_messages
			redirect_to "/dashboard/"+session[:user_id].to_s
		end
	end

	def destroy
		Shoe.find(params[:id]).destroy
		redirect_to "/dashboard/"+session[:user_id].to_s
	end

	def update
		Shoe.find(params[:id]).update_attributes(:buyer => User.find(session[:user_id].to_i))
		redirect_to '/shoes'

	end


	private
	def shoe_params
		params.require(:shoe).permit(:name, :amount)
	end
end
