require 'colorize'

##Out Object
#Sets a standard set of output methods to keep consistent
#output formatting to user
class Out
  def self.Message(msginput)
    puts "#{msginput}".light_blue
  end

  def self.Prompt(msginput)
    puts "\n#{msginput}"
    print ">\t"
  end

  def self.Output(msginput)
    puts ">\t#{msginput}".light_blue
  end

  def self.testOutput(msginput)
    puts "\n\n>>#{msginput}".light_blue
  end

  def self.Action(msginput)
    puts "Action\:\t#{msginput}".bold
  end

  def self.Warning(msginput)
    puts "#{msginput}".red
  end
end

##
#Control class.  Set of variables to be interpretted by Interpeter class
#Interpreter class uses variables to decide which commands to send to Util-dir
class Control
  #Set accessors for class
  attr_accessor :valid
  attr_accessor :command
  attr_accessor :method
  attr_accessor :mod
  attr_accessor :arg

  def initialize(valid, command, method, mod, arg)
    @valid = valid
    @command = command
    @method = method
    @mod = mod
    @arg = arg
  end

  #Appends argument/modifier to arrays in control instance
  def addArg(modifier, argument)
    @mod << modifier
    @arg << argument
  end

  #Returns string with contents of control instance
  def parameters
    modifier = ""
    args = ""
    @mod.each do |mod_st|
      modifier.concat("#{mod_st}, ")
    end

    @arg.each do |arg_st|
      args.concat("#{arg_st}, ")
    end

    outputstr =
    "Validity:\t#{@valid}
    Command:\t#{@command}
    Method:\t#{@method}
    Modifier Strings:\t#{modifier}
    Arguments:\t#{args}"

    return outputstr
  end
end

class Interpretter

  attr_reader :input

  #Define Initialize Function
  def initialize(input)
    @input = input
    self.formatInput
  end

  def formatInput
    @input = @input.chomp.downcase
    @input = @input.strip.delete '\\'
  end

end

class Util_dir
  def initialize (dirpath)
    #define instance variables
    @dirpath = dirpath.strip.delete '\\'
    @filelist = Dir.entries(@dirpath).reject{|entry| entry == "." || entry == ".."}
  end

##
#Renaming Functions

  #Define name_processing function
  #Function requires "process" input.  Input can be prefix, suffix, or rename.
  #Walks user through steps to batch rename
  def Suffix (process)

  end

##
#Functions to return instance variables

#Returns the directory
  def filepath
    return @dirpath
  end

  #Returns the list of files, and outputs them each to a new line
  def listfiles
    #Output filelist to terminal
    @filelist.each do |s|
      Out.Output(s)
    end

    #Return @filelist string array
    return @filelist
  end

end
