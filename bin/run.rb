require_relative '../config/environment'

def welcome_message
    puts "
╭╮╭╮╭╮╱╱╭╮╱╱╱╱╱╱╱╱╱╱╱╱╱╱╭╮╱╱╱╱╭━━━╮╭╮╱╱╱╱╱╱╱╱╱╱╱╱╱╭━━╮╭╮
┃┃┃┃┃┃╱╱┃┃╱╱╱╱╱╱╱╱╱╱╱╱╱╭╯╰╮╱╱╱┃╭━━╋╯╰╮╱╱╱╱╱╱╱╱╱╱╱╱┃╭╮┃┃┃                    
┃┃┃┃┃┣━━┫┃╭━━┳━━┳╮╭┳━━╮╰╮╭╋━━╮┃╰━━╋╮╭╋━╮╭━━┳━━┳━━╮┃╰╯╰┫┃╭━━┳━━┳━━┳━━┳━╮
┃╰╯╰╯┃┃━┫┃┃╭━┫╭╮┃╰╯┃┃━┫╱┃┃┃╭╮┃┃╭━━╋┫┃┃╭╮┫┃━┫━━┫━━┫┃╭━╮┃┃┃╭╮┃╭╮┃╭╮┃┃━┫╭╯
╰╮╭╮╭┫┃━┫╰┫╰━┫╰╯┃┃┃┃┃━┫╱┃╰┫╰╯┃┃┃╱╱┃┃╰┫┃┃┃┃━╋━━┣━━┃┃╰━╯┃╰┫╰╯┃╰╯┃╰╯┃┃━┫┃
╱╰╯╰╯╰━━┻━┻━━┻━━┻┻┻┻━━╯╱╰━┻━━╯╰╯╱╱╰┻━┻╯╰┻━━┻━━┻━━╯╰━━━┻━┻━━┻━╮┣━╮┣━━┻╯
╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╭━╯┣━╯┃
╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╰━━┻━━╯
We provide you the platform to record your workout sessions with your trainer
""\n"
end


def list_trainers
    puts "\n""These are the list of trainers available\n"
    Trainer.all.each do |tr|
        puts "name: #{tr.name}" + "   " + "Yrs of Experience: #{tr.yrs_exp}"+ "    " + "Cost: #{tr.cost}" + "   " + "Trainer_id: #{tr.id}" "\n"       
    end
end



def get_user_info
 puts "Enter your name"
  n=gets.chomp
  puts "Enter your gender"
  g=gets.chomp
  puts "The Following data will be used to calculate your starting BMI"
  puts "Enter your weight in kilogram"
  w=gets.chomp
  puts "Enter your height in centimeter"
  h=gets.chomp
  User.create(:name=>n, :gender=>g, :weight=>w, :height=>h)
#   puts "Great you are now in our database"
#   puts "Do you want to create a record? y/n"
#   s=gets.chomp
#     if s=='y'
#         create_workouts
#     elsif s=='n'
#         list_trainers
#     else
#         puts "Not a valid response, please enter y or n"
#     end 
end

def prompt_user
puts "Are you a first time user? y/n"
opt=gets.chomp
    if opt==y
    get_user_info
    elsif opt==n
    list_trainers
    else 
    puts "Not a valid response, please enter y or n"
    end
end

def quit?
     puts "Would you like to exit ? y/n"
    op=gets.chomp
        if op==y
        exit
        elsif op==n
        list_trainers
        else
        puts "Not a valid response, please enter y or n"
        end
end
    welcome_message

    binding.pry 
   

   
puts "BYE BYE!"
