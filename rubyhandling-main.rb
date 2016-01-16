#Include files needed to run
load 'textcontent.rb'
load 'rubyhandling-fn.rb'


#Define program variables
run = TRUE
directory = nil

#Output introduction to user
introduce

#Initialize program loop
begin

  #prompt user for input
  Out.Prompt("\n\nEnter command...")
  input = gets.chomp.upcase

  #Initialize case statement to select
  case input

    ##
    #When user enters directory command
    #Checks if directory is already defined.  If not, prompts user for a directory
    #If directory is defined, tells user current directory and then asks if user wants to reselect directory
    when "DIRECTORY"
      if directory == nil
        dir_input = 'y' #if directory hasn't yet been defined, define directory
      else
        #if directory has been defined, ask user if they wish to redefine
        Out.Message("\nCurrent directory:\t#{directory.filepath}\n")
        Out.Prompt("Do you wish to change the directory? (Y/N)\n")
        dir_input = gets.chomp.downcase
      end

      ##
      #if user wishes to define directory, prompt user for directory name
      #create new Util_dir instance, directory
      if dir_input == 'y'
        Out.Prompt("\nEnter directory name (or on OSX, drag folder into terminal screen)...")
        directoryname = gets.chomp.downcase
        directory = Util_dir.new(directoryname)
        Out.Message("\nNew directory:\t#{directory.filepath}")
      end

    #list files within scope of modification
    when "DIRECTORY LIST"
      directory.listfiles

    ##
    #When user enters quit command
    #Defines run as FALSE, exiting the program
    when "QUIT"
      run = FALSE
      Out.Message("Program terminated\n")

    when "HELP"
      batch_help

    else
       Out.Message("Please enter a valid command.  Type \"help\" for options")
  end

end until run == FALSE
