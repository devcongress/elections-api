class V1::ElectionsController < ApplicationController
  before_action :set_election, only: [:show]

  def index
    render json: Election.all
  end

  def create
    election = Election.new(election_params)
    if election.save
      render status: :created, json: election
    else
      render status: :bad_request, json: prepare_error(election.errors)
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

    def extract_attributes!
      parse_params require: %w(
        year
        started-at
        ended-at
      )
    end

    def election_params
      attrs
    end
end
