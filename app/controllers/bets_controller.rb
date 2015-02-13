class BetsController < ApplicationController
  before_action :set_bet, only: [:show, :edit, :update, :destroy, :truefalse, :setWon, :setLost]
require 'pry'
  # GET /bets
  # GET /bets.json
  def index
    @bets = Bet.where(user_id: current_user.id)

  end
  def list
   @bets = Bet.where(user_id: current_user.id)

  end
  def stats
   @bets = Bet.where(user_id: current_user.id)
 end
 def settings
  @bets = Bet.where(user_id: current_user)
 end 
  # GET /bets/1
  # GET /bets/1.json
  def show
  end
 
  # GET /bets/new
  def new
    @bet = Bet.new
  end

  # GET /bets/1/edit
  def edit
  end

  # POST /bets
  # POST /bets.json
  def create
    @bet = Bet.new(bet_params)
    @bet.user_id = current_user.id
    @bet.before_save
    if @bet.result ==1
      @bet.gain= ((@bet.bet * @bet.course ) - @bet.bet).round(3)
    elsif @bet.result ==0
      @bet.gain= -@bet.bet.round(3)
    end
    respond_to do |format|
      if @bet.save
        if @bet.result == 0
          vypocet = -@bet.bet.round(3)
          @bet.update_attributes(result: 0, gain:vypocet)
        elsif @bet.result == 1
          vypocet = ((@bet.bet * @bet.course ) - @bet.bet).round(3)
          @bet.update_attributes(result: 1, gain: vypocet)
        elsif @bet.result==2
          @bet.update_attributes(result: 2, gain: 0)
        end

        format.html { redirect_to list_url, notice: 'Bet was successfully created.' }
        format.json { render :show, status: :created, location: @bet }
      else
        format.html { render :new }
        format.json { render json: @bet.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /bets/1
  # PATCH/PUT /bets/1.json
  def update
    respond_to do |format|
      if @bet.update(bet_params)
        format.html { redirect_to @bet, notice: 'Bet was successfully updated.' }
        format.json { render :show, status: :ok, location: @bet }
      else
        format.html { render :edit }
        format.json { render json: @bet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bets/1
  # DELETE /bets/1.json
  def destroy
    @bet.destroy
    respond_to do |format|-0
      format.html { redirect_to :back, notice: 'Bet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def truefalse
    @bet = Bet.find(params[:id])
    if @bet.result == 1
    vypocet = -@bet.bet.round(3)
    @bet.update_attributes(result: 0, gain:vypocet)
  elsif @bet.result == 0
    vypocet = ((@bet.bet * @bet.course ) - @bet.bet).round(3)
    @bet.update_attributes(result: 1, gain: vypocet)
  else 
    vypocet = ((@bet.bet * @bet.course ) - @bet.bet).round(3)
    @bet.update_attributes(result: 1, gain: vypocet)
  end
  redirect_to list_url
end

def setWon
  @bet = Bet.find(params[:id])
    vypocet = ((@bet.bet * @bet.course ) - @bet.bet).round(3)
    @bet.update_attributes(result: 1, gain: vypocet, remind:nil,reminder:nil)
  redirect_to list_url
end

def setLost
  @bet = Bet.find(params[:id])
    vypocet = -@bet.bet.round(3)
    @bet.update_attributes(result: 0, gain:vypocet, remind:nil,reminder:nil)
    redirect_to list_url
end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bet
      @bet = Bet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bet_params
      params.require(:bet).permit(:match, :course, :bet, :result, :gain, :team1, :team2, :remind, :reminder)
    end
end
