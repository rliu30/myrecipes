class ReviewsController < ApplicationController
	before_action :set_review, only: [:edit, :update, :destroy]
	before_action :require_user
	before_action :set_recipe

	def new
		@review = Review.new
	end

	def create
		@review = Review.new(review_params)
		@review.chef = current_user
		@review.recipe_id = @recipe.id
		if @review.save
			flash[:success] = "Your review was created successfully"
			redirect_to recipes_path(@recipe)
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @review.update(review_params)
			flash[:success] = "Your review was updated successfully"
			redirect_to recipes_path
		else
			render :edit
		end
	end

	def destroy
		Review.find(params[:id]).destroy
		flash[:success] = "Your review was destroy"
		redirect_to recipes_path
	end

	private

		def review_params
			params.require(:review).permit(:rating, :comment)
		end

		def set_review
			@review = Review.find(params[:id])
		end
        
        def set_recipe
			@recipe = Recipe.find(params[:recipe_id])
		end


end
