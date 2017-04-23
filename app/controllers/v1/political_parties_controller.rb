class V1::PoliticalPartiesController < ApplicationController
  before_action :set_party, only: [:show]

  def index
  end

  def create
  end

  def show
    render json: @party
  end

  def update
  end

  def destroy
  end


  private

    def set_party
      @party = PoliticalParty.find_by(id: params[:id])
      render status: :not_found and return unless @party
    end
end
