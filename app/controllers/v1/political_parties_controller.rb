class V1::PoliticalPartiesController < ApplicationController
  before_action :parse_json_api_payload, only: [:create]
  before_action :set_party, only: [:show]

  def index
    render json: PoliticalParty.all
  end

  def create
    party = PoliticalParty.new(party_params)
    if party.save
      render status: :created, json: party
    else
      render status: :bad_request, json: party.errors.messages
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

    def parse_json_api_payload
      @body = ActiveModelSerializers::Deserialization.jsonapi_parse params,
      only: [
        :name,
        :slogan,
        :chairman,
        :"general-secretary",
        :"logo-url",
        :colors
      ]

      # TODO(yawboakye): include informative error object
      render status: :unprocessable_entity if @body.empty?
    end

    def party_params
      @body
    end
end
