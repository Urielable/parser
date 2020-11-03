class Api::V1::ExpedientsController < ApplicationController

  # GET /api/v1/expedients
  # GET /api/v1/expedients.json
  def index
    @expedients = Expedient.all
    render json: @expedients
  end

  # GET /api/v1/expedients/1
  # GET /api/v1/expedients/1.json
  def show
    @expedient = Expedient.find_by_id(params[:id])
  end

  # POST /api/v1/promoters
  # POST /api/v1/promoters.json
  def create
    @response, code = ParseExpedientAction.execute(expedient_params[:uri])
    if (200..399).to_a.include? code
      @expedient = SaveExpedientAction.execute(@response)
      render :show, status: code
    elsif (400..499).to_a.include? code
      render :error, status: code
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expedient
      @user = Expedient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def expedient_params
      params.require(:expedient).permit(:uri)
    end
end
