#!/usr/bin/env ruby

require "date"
require "optparse"
class Calendar
  def decide_date (year , month)
    if year != nil 
      @year = year.to_i
    else
      @year = Date.today.year
    end
    if 1 <= month.to_i && month.to_i <= 12 && month != nil
      @month = month.to_i
    else
      @month = Date.today.mon
    end  
  end
  def calendar_display
    week=" 日 月 火 水 木 金 土 "
    puts "#{@month}月　#{@year}".center(20)
    puts week
    month_lastday = Date.new(@year , @month , -1).day
    (1..month_lastday).each do |day|
      current_date=Date.new(@year , @month , day)
        if day == 1
          print " ".rjust(3) * (current_date.wday)
          if current_date.strftime("%a") == "Sat"
            
            puts day.to_s.rjust(3)
          else
            print day.to_s.rjust(3)
          end
        elsif current_date.strftime("%a") == "Sat"
          puts day.to_s.rjust(3)
        else
          print day.to_s.rjust(3)
        end  
      end
      print "\n"  
  end 
end

argv=ARGV.getopts("y:m:")
calendar=Calendar.new
calendar.decide_date(argv["y"] , argv["m"])
calendar.calendar_display
