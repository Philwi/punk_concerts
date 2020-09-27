class ShowsController < ApplicationController
  before_action :set_show, only: [:show, :edit, :update, :destroy]

  def index
    @shows ||= Show.upcoming.limit(10)
    render html: cell(Show::Cell::Index, @shows, params: params), layout: 'application'
  end

  # GET /shows/1
  # GET /shows/1.json
  def show
  end

  # GET /shows/new
  def new
    run Show::Operation::Create::Present
    render html: cell(Show::Cell::New, @form), layout: 'application'
  end

  # GET /shows/1/edit
  def edit
  end

  def create
    result = Show::Operation::Create.(params: params, recaptcha: verify_recaptcha)
    if result.success?
      redirect_to shows_path, notice: 'Show was successfully created.'
    else
      render html: cell(Show::Cell::New, result[:'contract.default']), layout: 'application'
    end
  end

  # PATCH/PUT /shows/1
  # PATCH/PUT /shows/1.json
  def update
    respond_to do |format|
      if @show.update(show_params)
        format.html { redirect_to @show, notice: 'Show was successfully updated.' }
        format.json { render :show, status: :ok, location: @show }
      else
        format.html { render :edit }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shows/1
  # DELETE /shows/1.json
  def destroy
    @show.destroy
    respond_to do |format|
      format.html { redirect_to shows_url, notice: 'Show was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    city = params.dig('show', 'city')
    @shows ||= Show.upcoming.where("city ILIKE ?", "%#{city}%").limit(10)
    render html: cell(Show::Cell::Index, @shows, params: params), layout: 'application'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show
      @show = Show.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def show_params
      params.fetch(:show, {})
    end
end
