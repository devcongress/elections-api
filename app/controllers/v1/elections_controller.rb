class V1::ElectionsController < ApplicationController
  before_action :set_election, only: [:show]

  def index
  end

  def create
  end

  def show
    render json: @election
  end

  def update
  end

  def destroy
  end


  private

    def set_election
      @election = Election.find_by(id: params[:id])
      render status: :not_found and return unless @election
    end
end
