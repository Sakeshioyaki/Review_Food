class RestaurantReviewController < ApplicationController
    before_action :set_restaurant_review, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!


  def index
    @reviews = Review.all
  end


  def show
  end

  def new
    @reviews = Review.new
  end

  def edit
  end


  def create
    @reviews = Review.new(restaurant_review_params)
    @reviews.user_id=current_user.id

    respond_to do |format|
      if @reviews.save
         url = "/subjects/" + @reviews.restaurant_id.to_s
        format.html { redirect_to url, notice: 'Restaurant review was successfully created.' }
        format.json { render :show, status: :created, location: @reviews }
      else
        format.html { render :new }
        format.json { render json: @reviews.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @reviews.update(restaurant_review_params)
        format.html { redirect_to @reviews, notice: 'Restaurant review was successfully updated.' }
        format.json { render :show, status: :ok, location: @reviews }
      else
        format.html { render :edit }
        format.json { render json: @reviews.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @reviews.destroy
    respond_to do |format|
      format.html { redirect_to Restaurant_reviews_url, notice: 'Restaurant review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_restaurant_review
      @reviews = Review.find(params[:id])
    end

    def restaurant_review_params
      params.require(:restaurant_review).permit(:user_id, :restaurant_id, :comment)
    end
end