require 'pry'
class AttractionsController < ApplicationController
    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.new(attraction_params)
        if @attraction.save
            redirect_to attraction_path(@attraction)
        else
            redirect_to new_attraction_path, alert: "Unable to create attraction with given fields"
        end
    end

    def index
        @attractions = Attraction.all
        @user = current_user
    end

    def show
        @attraction = Attraction.find_by(id: params[:id])
        @user = current_user
    end

    def edit
        @attraction = Attraction.find_by(id: params[:id])
    end

    def update
        @attraction = Attraction.find_by(id: params[:id])
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
end