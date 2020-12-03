class RestaurantReviewsController < ApplicationController
    before_action :set_restaurant_review, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!


  def index
    @restaurant_reviews = RestaurantReview.all
  end


  def show
  end

  def new
    @restaurant_review = RestaurantReview.new
  end

  def edit
  end


  def create
    @restaurant_review = RestaurantReview.new(restaurant_review_params)
    @restaurant_review.user_id=current_user.id

    respond_to do |format|
      if @restaurant_review.save
         url = "/restaurants/" + @restaurant_review.restaurant_id.to_s
        format.html { redirect_to url, notice: 'Restaurant review was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant_review }
      else
        format.html { render :new }
        format.json { render json: @restaurant_review.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @restaurant_review.update(restaurant_review_params)
        format.html { redirect_to @restaurant_review, notice: 'Restaurant review was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant_review }
      else
        format.html { render :edit }
        format.json { render json: @restaurant_review.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @restaurant_review.destroy
    respond_to do |format|
      format.html { redirect_to Restaurant_reviews_url, notice: 'Restaurant review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_restaurant_review
      @restaurant_review = RestaurantReview.find(params[:id])
    end

    def restaurant_review_params
      params.require(:restaurant_review).permit(:user_id, :restaurant_id, :comment)
    end
end