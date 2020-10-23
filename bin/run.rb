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

def prompt_user     #Checks for new user or existing user and directs them accordingly
    prompt3= TTY::Prompt.new

    p= prompt3.yes?("Are you a first time user?")
    
    if p==true
    puts ("We need to you to register with us")
    get_user_info 
        
    elsif p==false
        c=prompt3.ask("What is your name?", default: ENV["name"])
        ice=User.find_by(name: c) # Checks if the name entered is in the database
        if ice==nil
          puts "That name is not in our database"
          prompt_user
        elsif ice.name==c
        existing_user(ice) # Takes us to options for existing_user if the name is in the database
        end
    end
end

def list_trainers   #shows a list of trainers already populated from a seed file
    puts "\n""
    ------------These are the list of trainers available--------
    
    "
    Trainer.all.each do |tr|
        puts "|"+"name: #{tr.name}" + "|     " + "Yrs of Experience: #{tr.yrs_exp}"+ "|     " + "Cost: #{tr.cost}" + "|     " + "Trainer_id: #{tr.id}" +"|"     
    end
end

def create_workout (user_c) # user_c is an instance of user class and is coming from existing_user method
    list_trainers
    prompt = TTY::Prompt.new    
    t= prompt.select("----------------------------------------------------------------------
    Please select the trainer id from the list of trainers", %w(2 3 4 5 6 7 8 9 10 11)) # collect info for the trainer_id key by selecting trainer_id populated in seed file
    exercise= prompt.ask("Write your exercise details here:", default: ENV["Bench Press | Weight = 50lbs | 3 reps X 10"]) # collect info on exercise key
    w=Workout.create(:exercises_done=>exercise, :trainer_id=>t, :user_id=>user_c.id) # creates instances of workout
    existing_user(user_c)      # loop 
end

def existing_user(member) # member is an instance of the user class and is coming from either get_user_info for new user
                          # or from prompt_user for returning user
                          
    puts "
    --------------Welcome to your Fitness Blog #{member.name}!----------------"
    w=member.weight.to_f
    h=member.height.to_f
    bmi= (703 * w/ (h*h))
    puts "
    --------------------------------These are the features we offer--------------------------
        Create Exercises       View Exercises        Delete Exercises     Update Exercises
        My starting Weight=#{w}  My starting BMI=#{bmi}  My starting Height=#{h}  View Trainers
    -----------------------------------------------------------------------------------------"
    prompt1 = TTY::Prompt.new
    a= prompt1.select("What would you like to do?") do |menu|       # return type of selection is string
        menu.choice 'Create Exercises', -> {create_workout(member)}  # instantiate workouts, and connect trainer to user
        menu.choice 'View Exercises', -> {get_workout(member)}     # associations, should work if a workout is created
        menu.choice 'View Trainers', -> {get_trainers(member)}    # associations, should work if a workout is created
        menu.choice 'Delete Exercises', -> {delete_workouts(member)}
        menu.choice 'Quit?', -> {exit}
         end
end

def get_workout(m2)

    if m2.workouts==nil
        puts "You don't have any workouts"
    else
        m2.workouts.each do |w_out| 
        puts w_out.exercises_done
        end
    end
    existing_user(m2)
end

def get_trainers(m1)
    #binding.pry
    if m1.trainers==nil
        puts "You didn't work with any trainer"
    else
        m1.trainers.each do |tr|
        puts "Name:#{tr.name}" + "| " + "Cost: #{tr.cost}" +"| " + "Years of experience: #{tr.yrs_exp}" +"| " + "About Me: #{tr.about_me}"
        end
    end
    existing_user(m1)
end

def delete_workouts(m3)
    
    if m3.workouts==nil
        puts "You don't have any workouts"
    else
        m3.workouts.each do |w_out|
        puts "Exercises done: #{w_out.exercises_done}" + "| " + "Workout id: #{w_out.id}"
        end
         puts "Enter the Workout id you want to delete"
         w=gets.chomp
         @wout=Workout.find_by(id: w)
         @wout.destroy
    end
    existing_user(m3)
end


def get_user_info # asks user for their information and stores the infromation in a table/database
    prompt = TTY::Prompt.new    
    n= prompt.ask("What is your name?", default: ENV["USER"])
    g= prompt.select("Are you male or female?", %w(Male Female))
    w= prompt.ask("Enter your weight in pounds", default: ENV["e.g 185"])
    h= prompt.ask("Enter your height in inches", default: ENV["e.g 67 1ft=12in"])
    
  a=User.create(:name=>n, :gender=>g, :weight=>w, :height=>h)
  
  puts "
  ---------------------------------------------------
  Great you are now in our database!
  We will now take you over to the options for existing user
  ----------------------------------------------------------"
  existing_user(a)
end


    

   welcome_message
   prompt_user

   #binding.pry 
   
puts "BYE BYE!"
