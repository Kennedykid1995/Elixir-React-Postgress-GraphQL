defmodule M do
    def main do
    do_stuff()
    end
    def do_stuff do
    age = 16
    # IO.puts "Vote & Drive : #{(age >= 16) and (age >= 18)}" 
    # IO.puts "Vote & Drive : #{(age >= 16) or (age >= 18)}" 

    # IO.puts not true

    if age >= 8 do
        IO.puts "Can Vote"
    else
        IO.puts "Can't Vote"
    end

    unless age === 18 do
        IO.puts "You are not 18"
    else    
        IO.puts "You are 18"
    end
end
