class BattleController < ApplicationController
  def new
  end
  
  def create
    
    @battle_result = BattleResult.new
    results = gen_battle_results(params[:song1_name],params[:lyrics1],params[:song2_name],params[:lyrics2])
    
    @battle_result.winner = results.last
    @battle_result.save
    
    redirect_to :back
    
  end
  
  def show 
    
  end
  
  
end
