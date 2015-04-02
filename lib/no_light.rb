# encoding: utf-8
require 'open-uri'
SCHEDULE=[]
class NoLight < Adhearsion::CallController
  include GoogleTTSPlugin::ControllerMethods
  before_call do
    schedule=open('http://202.70.77.195/schedule/schedule.txt')
    for group in schedule.each do
        SCHEDULE<<group
      end
    end

    def run
      answer
      group_no=dial_group
      schedule_for_day=[]
      schedule_for_day=SCHEDULE.rotate(-(group_no-1))
      puts schedule_for_day
      day=Time.now()
      day_no=day.strftime("%u").to_i
      loadshadding_time=schedule_for_day[day_no].split(' ')
      morning_time=loadshadding_time[0].delete('()').split('-')
      evening_time=loadshadding_time[1].delete('()').split('-')
      say "Loadshedding suru hune samaya"
      manupulate_time(morning_time,'m')
      say "ra"
      manupulate_time(evening_time, 'e')
      hangup
    end
    def dial_group
      say 'tapaiko group k ho.'
      input=ask "", "", :timeout => 10, :limit =>1
      return input.utterance.to_i
    end

    def say_num(num)
      hour_min_array= num.split(':')
      hour,min=hour_min_array[0].to_i, hour_min_array[1].to_i
      if hour > 12
        play_numeric hour -12
      else
        play_numeric hour
      end
      play_numeric min if min != 0
    end

    def manupulate_time(time,which_time)
      start_at, end_at=time[0], time[1]
      if which_time=='m'
        say "bihanako"
      elsif which_time =='e'
        say "beluka"
      else
        puts "error"
      end
      say_num(start_at)
      say "bajay dekhi"
      say_num(end_at)
      say "bajay samma huncha."
    end
  end
