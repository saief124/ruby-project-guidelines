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
          # loop 
end

def bmi_calculator(user_b)  # user_b is an instance of user class and is coming from existing_user method
    # 703 * weight(lbs) / height(in)^2
    b=user_b.weight
    c=user_b.height
    bmi = (703 * b / (c*c))
    
    return bmi
    #prompt_user             #loop 
end

def bmi_change(user_bm)
    
    puts ("What is your current weight?")
    w= gets.chomp
    puts ("What is your current height? (This one is for you growing kids :D )")
    h= gets.chomp
    c_w=w.to_f
    c_h=h.to_f
    o_h= user_bm.height
    o_w= user_bm.weight
    old_bmi= (703 * o_w / (o_h * o_h))
    new_bmi= (703 * c_w / (c_h * c_h))
    bmi_change = new_bmi-old_bmi
    bmi_change
  
end

def weight_change(user_w)
    old_weight=user_w.weight 
    puts "Enter your current weight"
    new_weight= gets.chomp
    n_w=new_weight.to_f
    w_change=n_w-old_weight
    w_change
    
end
def my_weight(user_r)
    a= user_r.weight
    b= a.to_f
    return b
end

def existing_user(member) # member is an instance of the user class and is coming from either get_user_info for new user
                          # or from prompt_user for returning user
    
    puts "--------------Welcome to your Fitness Blog #{member.name}!----------------"
    puts "
    ---------------------These are the features we offer----------------------------
        Create a workout           View my Trainers            View My Workout 
        My starting Weight      My starting BMI      Weight change      BMI change
    --------------------------------------------------------------------------------"
    prompt1 = TTY::Prompt.new
    a= prompt1.select("What would you like to do?") do |menu|       # return type of selection is string
        menu.choice 'My starting Weight', -> {my_weight(member)}    # instance method that acts like a class method
        menu.choice 'My starting BMI', -> {bmi_calculator(member)}  # instance method that acts like a class method
        menu.choice 'Create a Workout', -> {create_workout(member)} # instantiate workouts, and connect trainer to user
        menu.choice 'Quit?', -> {exit}
        if member.workouts != []                                     # no need to see the following info if you havent worked out yet
         menu.choice 'View My Workouts', -> {member.workouts}        # associations, should work if a workout is created
         menu.choice 'View My Trainers', -> {member.trainers}        # associations, should work if a workout is created
         menu.choice 'BMI Change', -> {bmi_change(member)}           # relations to self
         menu.choice 'Weight Change', -> {weight_change(member)}     # relations to self
         menu.choice 'Quit?', -> {exit}
         end
     end
    
end

def get_user_info # asks user for their information and stores the infromation in a table/database
    prompt = TTY::Prompt.new    
    n= prompt.ask("What is your name?", default: ENV["USER"])
    g= prompt.select("Are you male or female?", %w(Male Female))
    w= prompt.ask("Enter your weight in pounds", default: ENV["e.g 185"])
    h= prompt.ask("Enter your height in inches", default: ENV["e.g 67 1ft=12in"])
    
  a=User.create(:name=>n, :gender=>g, :weight=>w, :height=>h)
  
  puts "---------------------------------------------------
  Great you are now in our database!
  We will now take you over to the options for existing user
  ----------------------------------------------------------"
  

 bmi_calculator(a)
 existing_user(a)
end

    welcome_message
    prompt_user
   # binding.pry 
   
puts "BYE BYE!"
