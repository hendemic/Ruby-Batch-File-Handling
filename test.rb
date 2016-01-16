load 'textcontent.rb'
load 'rubyhandling-fn.rb'

#test control object
Out.Message("Testing control object...\n")
ctrl_test_1 = Control.new(TRUE, "command", "method", ["-a","-f"],["arg1","arg2"])

Out.testOutput("Execute ::parameters")
Out.Message(ctrl_test_1.parameters)

Out.testOutput("Execute each variable return")
Out.Message(ctrl_test_1.valid)
Out.Message(ctrl_test_1.command)
Out.Message(ctrl_test_1.method)
Out.Message(ctrl_test_1.mod)
Out.Message(ctrl_test_1.arg)

Out.testOutput("Adding argument to control instance...")
ctrl_test_1.addArg("-add","new-argument")
Out.Message(ctrl_test_1.parameters)

Out.testOutput("Defining new interpretter for input >DIRECTORY -f Users/Michael/Documents/Programming\\ cool\\ stuff ")
interpret = Interpretter.new("DIRECTORY -f Users/Michael/Documents/Programming\\ cool\\ stuff    ")
Out.Message("<MESSAGE>" + interpret.input + "</MESSAGE>")

Out.testOutput("Defining new interpretter for input >RENAME suffix -t add -f suffix1")
interpret = Interpretter.new("RENAME suffix -t add -f suffix1")
Out.Message("<MESSAGE>" + interpret.input + "</MESSAGE>")
