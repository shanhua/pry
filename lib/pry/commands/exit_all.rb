class Pry
  Pry::Commands.create_command "exit-all" do
    group 'Navigating Pry'
    description "End the current Pry session (popping all bindings) and " \
      "returning to caller. Accepts optional return value. Aliases: !!@"

    def process
      # calculate user-given value
      exit_value = target.eval(arg_string)

      # clear the binding stack
      _pry_.binding_stack.clear

      # break out of the repl loop
      throw(:breakout, exit_value)
    end
  end

  Pry::Commands.alias_command "!!@", "exit-all"
end
