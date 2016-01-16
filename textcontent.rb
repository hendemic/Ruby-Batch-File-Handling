def introduce
  introstring = "\t\t<<<Welcome to Ruby Batch File Handling>>> \n
  \t\tCreated by Michael Henderson, 2015 \n\n
  \t\tTo get started enter a command.  Type \"help\" for a list of commands. \n"

  puts "\n\n#{introstring}".light_blue    #Output contents of commands.txt

end

def batch_help
  #Read commands.txt
  helpfile = File.open("commands.txt")
  helplist = helpfile.read

  Output_Formatter.Message(helplist)   #Output contents of commands.txt

  helpfile.close
end
