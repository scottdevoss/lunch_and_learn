class Api::V1::LearningResourcesController < ApplicationController
  def index
    resources = LearningResourcesFacade.new(params[:country]).resources
    render json: resources

    images = ImageFacade.new(params[:country]).images
  end
end