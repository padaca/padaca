class MitfahrersController < ApplicationController
  before_action :set_mitfahrer, only: [:show, :edit, :update, :destroy]

  # GET /mitfahrers
  # GET /mitfahrers.json
  def index
    @counterpart = :mitfahrer
    @mitfahrers = Mitfahrer.joins(:fahrt).where(fahrts: { account_id: current_account.id })

    if mitfahrer_filter_params[:fahrt]
      @mitfahrers.where!(fahrt_id: params[:fahrt])
    end

  end

  # GET /mitfahrers/1
  # GET /mitfahrers/1.json
  def show
  end

  # GET /mitfahrers/new
  def new
    @mitfahrer = Mitfahrer.new(fahrt_id: params[:fahrt], account: current_account)
  end

  # GET /mitfahrers/1/edit
  def edit
  end

  # POST /mitfahrers
  # POST /mitfahrers.json
  def create
    @mitfahrer = Mitfahrer.new(mitfahrer_params)

    respond_to do |format|
      if @mitfahrer.save
        format.html { redirect_to @mitfahrer, notice: 'Mitfahrer was successfully created.' }
        format.json { render :show, status: :created, location: @mitfahrer }
      else
        format.html { render :new }
        format.json { render json: @mitfahrer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mitfahrers/1
  # PATCH/PUT /mitfahrers/1.json
  def update
    respond_to do |format|
      if @mitfahrer.update(mitfahrer_params)
        format.html { redirect_to @mitfahrer, notice: 'Mitfahrer was successfully updated.' }
        format.json { render :show, status: :ok, location: @mitfahrer }
      else
        format.html { render :edit }
        format.json { render json: @mitfahrer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mitfahrers/1
  # DELETE /mitfahrers/1.json
  def destroy
    @mitfahrer.destroy
    respond_to do |format|
      format.html { redirect_to mitfahrers_url, notice: 'Mitfahrer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mitfahrer
      @mitfahrer = Mitfahrer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mitfahrer_params
      params.require(:mitfahrer).permit(:fahrt_id, :account_id, :mitfahrerbewertung, :fahrerbewertung, :istBestatigt)
    end

    def mitfahrer_filter_params
      params.permit(:fahrt)
    end
end
