class RpgController < ApplicationController
    def index
      if !session[:gold]
        session[:gold] = 0
      end
      
      if !session[:activity]
        session[:activity] = Array.new
      end

    end 
    
    def farm
        @earn = rand(10..20)
        session[:gold] = session[:gold] + @earn
      
        gettime = Time.now
        @time = gettime.strftime("%I:%M.%S %P")
        @date = gettime.strftime("%B %d, %Y")

        session[:activity].unshift "<span class = 'green'> Earned " + @earn.to_s + " gold from the farm! " + @time + ", " + @date + "</span>"
      
        redirect_to('/rpg/index')
    end 
    
    def house
        @earn = rand(2..5)
        session[:gold] = session[:gold] + @earn
        
        gettime = Time.now
        @time = gettime.strftime("%I:%M.%S %P")
        @date = gettime.strftime("%B %d, %Y")

        session[:activity].unshift "<span class = 'green'> Earned " + @earn.to_s + " gold from the house! " + @time + ", " + @date + "</span>"
        redirect_to('/rpg/index')
    end 
    
    def cave
        @earn = rand(5..10)
        session[:gold] = session[:gold] + @earn

        gettime = Time.now
        @time = gettime.strftime("%I:%M.%S %P")
        @date = gettime.strftime("%B %d, %Y")
        
        session[:activity].unshift "<span class = 'green'> Earned " + @earn.to_s + " gold from the cave! " + @time + ", " + @date + "</span>"
        redirect_to('/rpg/index')
    end 
    
    def casino 
        @earn = rand(-50..50)
        session[:gold] = session[:gold] + @earn
      
        gettime = Time.now
        @time = gettime.strftime("%I:%M.%S %P")
        @date = gettime.strftime("%B %d, %Y")

        if @earn < 0
            session[:activity].unshift "<span class = 'red'> Lost " + @earn.abs.to_s + " gold to the casino... Ouch! " + @time + ", " + @date + " </span>"
        else
            session[:activity].unshift "<span class = 'green'> Earned " + @earn.to_s + " gold from the casino! " + @time + ", " + @date + "</span>"
        end
        redirect_to('/rpg/index')
    end
    
    def restart
      @earn = nil
      session[:gold] = nil
      session[:activity] = nil
      redirect_to('/rpg/index')
    end
end
