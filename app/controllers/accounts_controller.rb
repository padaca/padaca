class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_action 

  # GET /accounts
  # GET /accounts.json
  def index
    # @accounts = Account.where(:istMitarbeiter => false)
    @accounts = Account.all
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
    unless is_my_account?(params[:id]) || current_account.istMitarbeiter
      redirect_to edit_account_path(current_account.id)
    end 
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def deactivate
    acc = Account.find(params[:account_id])
    if current_account.istMitarbeiter
      acc.deactivate_account!
      redirect_to accounts_path 
    else
      redirect_to :back
    end
  end

  def activate
    acc = Account.find(params[:account_id])
    if current_account.istMitarbeiter
      acc.activate_account!
      redirect_to accounts_path 
    else
      redirect_to :back
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:vorname, :nachname, :geschlecht, :istMitarbeiter, :fahrerbewertung, :mitfahrerbewertung, :standort)
    end

    # Checks whether the given id is equal to the current_account.id
    def is_my_account?(id)
      return id.to_i == current_account.id
    end
end
