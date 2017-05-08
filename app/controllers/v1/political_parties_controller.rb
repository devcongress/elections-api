class V1::PoliticalPartiesController < ApplicationController
  before_action :set_party, only: [:show]

  def index
    render json: PoliticalParty.all
  end

  def create
    party = PoliticalParty.new(party_params)
    if party.save
      render status: :created, json: party
    else
      render status: :bad_request, json: prepare_error(party.errors)
    end
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
      render status: :not_found && return unless @party
    end

    def extract_attributes!
      parse_params require: %w(
        name
        slogan
        chairman
        general-secretary
        logo-url
        colors
      )
    end

    def party_params
      attrs
    end
end
