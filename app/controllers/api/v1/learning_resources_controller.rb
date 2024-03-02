class Api::V1::LearningResourcesController < ApplicationController
  def index
    resources = LearningResourcesFacade.new(params[:country]).resources
  end
end