defmodule M do
    def main do
    # name = IO.gets("What is you name? ")|> String.trim
    # IO.puts "Hello #{name}"
    data_stuff()
    end
    def data_stuff do
    my_int = 123
    IO.puts "Integer #{is_integer(my_int)}"
    end
end
