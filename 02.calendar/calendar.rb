require "date"
require 'optparse'

def calender (y: Date.today.year,m: Date.today.mon)
    
    week=" 日 月 火 水 木 金 土 "
    puts "#{m}月　#{y}".center(20)
    puts week

    month_lastday=Date.new(y,m,-1).day
    (1..month_lastday).each do |x|

        x_day=Date.new(y,m,x)
        if x==1
            print " ".rjust(3)*(x_day.wday)
            print x.to_s.rjust(3)
        elsif (x_day.wday)==6
            print x.to_s.rjust(3)+"\n"
        else
            print x.to_s.rjust(3)
        end
    
    end
    print "\n"
   
end 

argv=ARGV.getopts("y:m:")

if argv["y"]!=nil && argv["m"]!=nil
    calender(y: argv["y"].to_i , m: argv["m"].to_i)
elsif argv["m"]!=nil 
    calender(m: argv["m"].to_i)
elsif argv["y"]!=nil
    calender(y: argv["y"].to_i )
else
    calender
end


