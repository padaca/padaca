class MitfahrersController < ApplicationController
  before_action :set_mitfahrer, only: [:show, :edit, :update, :destroy]

  # GET /mitfahrers
  # GET /mitfahrers.json
  def index
    # Liste der Fahrten und Mitfahten des aktuellen Users
    # select * from fahrts f left join mitfahrers m on f.id = m.fahrt_id where f.account_id = 1 or m.account_id = 1;
    if params[:filter] && !params[:filter].empty?
      if params[:filter] == '1'
        # der aktuelle User ist Fahrer
        @uebersicht = Fahrt.where(account_id: current_account.id)
      elsif params[:filter] == '0'
        # der aktuelle User ist Mitfahrer
        @uebersicht = Fahrt.joins("left join mitfahrers on fahrts.id = mitfahrers.fahrt_id").where("mitfahrers.account_id = #{current_account.id}")
      end
    else
      # alle Fahrten und Mitfahrten
      @uebersicht = Fahrt.joins("left join mitfahrers on fahrts.id = mitfahrers.fahrt_id").where("fahrts.account_id = #{current_account.id} or mitfahrers.account_id = #{current_account.id}")
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
end
