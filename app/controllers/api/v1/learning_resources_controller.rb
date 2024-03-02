class Api::V1::LearningResourcesController < ApplicationController
  def index
    video = LearningResourcesFacade.new(params[:country]).resources
    # render json: video

    images = LearningResourcesFacade.new(params[:country]).images

    resource_data = {
      country: params[:country],
      video: video,
      images: images
    }
    resources = ResourcesSerializer.new(resource_data)
    # require 'pry'; binding.pry
    render json: resources
  end
end