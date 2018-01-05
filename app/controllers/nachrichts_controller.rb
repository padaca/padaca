class NachrichtsController < ApplicationController
  before_action :set_nachricht, only: [:show, :edit, :update, :destroy]

  # GET /nachrichts
  # GET /nachrichts.json
  def index
    @nachrichts = Nachricht.where(empfaenger_id: current_account.id).each do |nachricht|
      if nachricht.empfaenger_id == current_account.id and nachricht.seen == nil
        nachricht.seen = Time.now
        nachricht.save!
        nachricht.seen = nil # is still unseen in ui, only seen in database
      end
    end
  end

  # GET /nachrichts/1
  # GET /nachrichts/1.json
  def show
    if @nachricht.empfaenger_id == current_account.id and not @nachricht.read
      @nachricht.read = Time.now
      @nachricht.save
    end
  end

  # GET /nachrichts/new
  def new
    @nachricht = Nachricht.new
  end

  # GET /nachrichts/1/edit
  def edit
  end

  # POST /nachrichts
  # POST /nachrichts.json
  def create
    @nachricht = Nachricht.new(nachricht_params)

    respond_to do |format|
      if @nachricht.save
        format.html { redirect_to @nachricht, notice: 'Nachricht was successfully created.' }
        format.json { render :show, status: :created, location: @nachricht }
      else
        format.html { render :new }
        format.json { render json: @nachricht.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nachrichts/1
  # PATCH/PUT /nachrichts/1.json
  def update
    respond_to do |format|
      if @nachricht.update(nachricht_params)
        format.html { redirect_to @nachricht, notice: 'Nachricht was successfully updated.' }
        format.json { render :show, status: :ok, location: @nachricht }
      else
        format.html { render :edit }
        format.json { render json: @nachricht.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nachrichts/1
  # DELETE /nachrichts/1.json
  def destroy
    @nachricht.destroy
    respond_to do |format|
      format.html { redirect_to nachrichts_url, notice: 'Nachricht was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nachricht
      @nachricht = Nachricht.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nachricht_params
      params.require(:nachricht).permit(:sender_id, :empfaenger_id, :nachricht)
    end
end
