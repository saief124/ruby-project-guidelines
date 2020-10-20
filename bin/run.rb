require_relative '../config/environment'

def welcome_message
 puts "
 ---------------------Welcome to Fitness Connector-----------------------------------
 Our goal is to connect you to trainers near you and give you the platform to record
                   your workout sessions with your selected trainer
 ------------------------------------------------------------------------------------
 "
end

def get_user_info
 puts "Enter your name"
  n=gets.chomp
  puts "Enter your gender"
  g=gets.chomp
  puts "Enter your weight"
  w=gets.chomp
  puts "Enter your height"
  h=gets.chomp
  User.create(:name=>n, :gender=>g, :weight=>w, :height=>h)
end

 def quit?
     puts "Would you like to exit ? Y/N"
    op=gets.chomp
    if op=='Y'
        exit
   elsif op =='N'
        puts "There will be a select opton to select features"
   else
        puts "Not a valid response, please enter Y or N"
    end
end

    welcome_message
    get_user_info
    quit?


puts "HELLO WORLD"
