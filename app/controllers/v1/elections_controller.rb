class V1::ElectionsController < ApplicationController
  before_action :parse_json_api_payload, only: [:create, :update]
  before_action :set_election,           only: [:show]

  def index
    render json: Election.all
  end

  def create
    election = Election.new(election_params)
    if election.save
      render status: :created,
               json: election
    else
      render status: :bad_request,
               json: election.errors.messages
    end
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
      unless @election
        render status: :not_found
        return
      end
    end

    def parse_json_api_payload
      @body = ActiveModelSerializers::Deserialization.jsonapi_parse params, only: [
        :year,
        :"started-at",
        :"ended-at"
      ]

      #TODO(yawboakye): include informative error object
      render status: :unprocessable_entity if @body.empty?
    end

    def election_params
      @body
    end
end
