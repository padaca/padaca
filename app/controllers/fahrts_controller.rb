class FahrtsController < ApplicationController

  before_action :set_fahrt, only: [:show, :edit, :update, :destroy]
  before_action :set_options

  after_action :restore_old_url, only: [:create, :update]
  before_action :capture_old_url, only: [:new, :show, :edit, :create]

  # GET /fahrts
  # GET /fahrts.json
  def search

    @fahrts = Fahrt.order(abfahrt: :asc).where.not(account: current_account)

    @fahrts = @fahrts.where "abfahrt >= current_timestamp" unless params[:show_all]

    @params_check = %i(von nach).map do |key|
      par = params[key]
      @fahrts = @fahrts.where("#{key.to_s} LIKE '%#{par}%'") unless par.nil? or par.empty?  # return as true-ish
    end

    @fahrts = nil unless @params_check.any? # supress query

    @hide_table = @fahrts.nil? || @fahrts.empty? # supress table

    @options[:details] = true

  end

  def index

    params.permit(:show_all)

    @options[:account] = false;
    @options[:marked] = true;

    @fahrts = Fahrt.where account: current_account

    @fahrts = @fahrts.where("abfahrt >= ?", DateTime.now) unless params[:show_all]

  end

  def mitfahrts
    @fahrts = Fahrt.joins(:mitfahrer).where(mitfahrers: { account_id: current_account.id })
  end

  # GET /fahrts/1
  # GET /fahrts/1.json
  def show
    @total = Mitfahrer.where(:fahrt_id => @fahrt.id, :istBestatigt => true).select("COUNT(*) AS total").first.total
    @anfragen = Mitfahrer.where("fahrt_id = #{@fahrt.id}")
  end

  # GET /fahrts/new
  def new
    params.permit(:fahrt)

    if params[:fahrt]
      @fahrt = Fahrt.find(params[:fahrt]).dup
      @fahrt.account = current_account
      @fahrt.id = nil
    else
      @fahrt = Fahrt.new(account: current_account)
    end
  end

  # GET /fahrts/1/edit
  def edit
  end

  # POST /fahrts
  # POST /fahrts.json
  def create
    @fahrt = Fahrt.new(fahrt_params)

    respond_to do |format|
      if @fahrt.save
        format.html { redirect_to @fahrt, notice: 'Fahrt was successfully created.' }
        format.json { render :show, status: :created, location: @fahrt }
      else
        format.html { render :new }
        format.json { render json: @fahrt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fahrts/1
  # PATCH/PUT /fahrts/1.json
  def update
    respond_to do |format|
      if @fahrt.update(fahrt_params)
        format.html { redirect_to @fahrt, notice: 'Fahrt was successfully updated.' }
        format.json { render :show, status: :ok, location: @fahrt }
      else
        format.html { render :edit }
        format.json { render json: @fahrt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fahrts/1
  # DELETE /fahrts/1.json
  def destroy
    @fahrt.destroy
    respond_to do |format|
      format.html { redirect_to fahrts_url, notice: 'Fahrt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def mark(marked=true)
      @fahrt = Fahrt.find(params[:fahrt_id]);
      @fahrt.istGespeichert = marked
      @fahrt.save!
      redirect_to :back
  end

  def unmark
      mark false
  end

  def marked(markedOnly = true)

      @options = {
        account: false,
        marked: false,
        new_from_marked: true,
      }

      @markedOnly = markedOnly
      @fahrts = Fahrt.where(account: current_account, istGespeichert: @markedOnly)
  end

  def unmarked
      marked(false)
      render 'marked'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fahrt
      @fahrt = Fahrt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fahrt_params
      params.require(:fahrt).permit(:von, :nach, :dauer, :preisProMitfahrer, :maxMitfahrer, :account_id, :abfahrt)
    end

    def set_options
      @options = {
        account: true,
        marked: false,
        new_from_marked: false,
        details: false,
      }
    end
end
