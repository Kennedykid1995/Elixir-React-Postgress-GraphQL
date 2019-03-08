defmodule M do
    def main do
    do_stuff()
    end

    def do_stuff do
    age = 16
    # decision making tools
    IO.puts "Vote & Drive : #{(age >= 16) and (age >= 18)}" 
    IO.puts "Vote & Drive : #{(age >= 16) or (age >= 18)}" 

    IO.puts not true

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
    cond do 
        age >= 18 -> IO.puts "You can vote"
        age >= 16 -> IO.puts "You can drive"
        age >= 14 -> IO.puts "You can wait"
        true -> IO.puts "Default"
    end 

    case 2 do
        1 -> IO.puts "Entered 1"
        2 -> IO.puts "Entered 2"
        _ -> IO.puts "default"
    end

    IO.puts "Ternary : #{if age > 18, do: "can vote", else: "Can't vote"}" 

    # Tuples
    my_stats = {175, 6.25, :Derek}

    IO.puts "Tuyple #{is_tuple(my_stats)}"

    my_stats2 = Tuple.append(my_stats, 42)

    IO.puts "Age #{elem(my_stats2, 3)}"

    IO.puts "Size : #{tuple_size(my_stats2)}"

    my_stats3 = Tuple.delete_at(my_stats2, 0)

    my_stats4 = Tuple.insert_at(my_stats3, 0, 19)

    many_zeros = Tuple.duplicate(0, 5)

    {weight, height, name} = {175, 6.25, "Derek"}

    IO.puts "Weight : #{weight}"

    # Lists

    list1 = [1,2,3]
    list2 = [4,5,6]

    list3 = list1 ++ list2

    list4 = list3 -- list1

    IO.puts 6 in list4

    [head | tail] = list3
    IO.puts "Head : #{head}"

    IO.write "Tail : "
    IO.inspect tail

    IO.inspect [97, 98], char_lists: :as_lists

    Enum.each tail, fn item -> 
        IO.puts item
    end

    words = ["Random", "words", "in", "a", "list"]

    Enum.each words, fn word-> 
        IO.puts word
    end    

    display_list(words)


    IO.puts display_list(List.delete(words, "Random"))
    IO.puts display_list(List.delete_at(words, 2))
    IO.puts display_list(List.insert_at(words, 4, "Yeah"))
    IO.puts List.first(words)
    IO.puts List.last(words)

    char_stats = [name: "Derek", height: 6.25]


    end

    def display_list([word|words]) do
        IO.puts word
        display_list(words)
    end
    def display_list([]), do: nil

    # Maps

    def other do
        do_other_stuff
    end

    def do_other_stuff do
        capitals = %{"Alabama" => "Montgomery",
         "Alaska" => "Juneau", "Arizona" => "Pheonix"}

         IO.puts "Capital of Alaska is #{capitals["Alaska"]}"

         capitals2 = %{alabama:  "Montgomery",
         alaska: "Juneau", arizona: "Pheonix"}

         IO.puts "Capital of Arizona is #{capitals2.arizona}"

         capitals3 = Dict.put_new(capitals, "Arkansas" , "Little Rock")

    end

    #Pattern Matching

    def pattern do
        do_pattern()
    end

    def do_pattern do
        [length, width] = [20, 30]
        IO.puts "Width : #{width}"

        [_,[_, a] ] = [20, [30, 40]]
        IO.puts "Get num: : #{a}" 
    end
    #anon functions 

    def anon do 
        do_anon()
    end

    def do_anon do
        get_sum = fn (x, y) -> x + y end

        IO.puts "5 + 5 = #{get_sum.(5,5)}"

        get_less = &(&1 - &2)

        IO.puts "7 - 6 = #{get_less.(7,6)}"

        add_sum = fn
        {x, y} -> IO.puts "#{x} + #{y} = #{x + y}"
        {x, y, z} -> IO.puts "#{x} + #{y} + #{z} = #{x + y + z}"
        end

        add_sum.({1,2})
        add_sum.({1,2,3})

        IO.puts do_it()
    end 

    def do_it(x \\ 1, y \\ 1) do
        x + y
    end
    
    #recursion

    def res do
        do_res()
    end

    def do_res do
        IO.puts "Factorial of 4 : #{factorial(4)}"
    end

    def factorial(num) do
        if num <= 1 do
            1
        else    
            result = num * factorial(num - 1)
            result
        end
    end

    #looping

    def loop do
        do_loop()
    end 

    def do_loop do
        IO.puts "Sum : #{sum([1,2,3])}"

        loop(5,1)
    end

    def sum([]), do: 0

    def sum([h|t]), do: h + sum(t)

    def loop(0, _), do: nil

    def loop(max, min) do
        if max < min do
            loop(0, min)
        else    
            IO.puts "Num: #{max}"
            loop(max - 1, min)
        end
    end  

    #Emun

    def enum do
        do_enum()
    end 

    def do_enum do
        IO.puts "Even list: #{Enum.all?([1,2,3], fn(n) -> rem(n, 2) == 0 end)}"
        
        IO.puts "Even list: #{Enum.any?([1,2,3], fn(n) -> rem(n, 2) == 0 end)}"

        Enum.each([1,2,3], fn(n) -> IO.puts n end)

        dbl_list = Enum.map([1,2,3], fn(n) -> n * 2 end)
        IO.inspect dbl_list

        sum_vals = Enum.reduce([1,2,3], fn(n, sum) -> n + sum end)
        IO.puts "Sum : #{sum_vals}"
        IO.inspect Enum.uniq([1,2,2])

    end

    #list comprehensions

    def comp do
        do_comp()
    end

    def do_comp do
        db_list = for n <- [1,2,3], do: n * 2
        IO.inspect db_list

        even_list = for n <- [1,2,3,4], rem(n, 2) == 0, do: n
        IO.inspect even_list
        

        err = try do 
            5 / 0
            rescue
            ArithmeticError -> "Can't Divide by 0"
            end

            IO.puts err
    end
    #concurrency

    def con do
        do_con()
    end

    def do_con do
        spawn(fn() -> loop(50, 1) end)
        spawn(fn() -> loop(100, 50) end)

        send(self(), {:french, "bob"})

        receive do
            {:german, name} -> IO.puts "Guten Tag #{name}"
            {:french, name} -> IO.puts "Bonjour #{name}"
            {:english, name} -> IO.puts "Hello #{name}"

            after
            500 -> IO.puts "Time up"
        end

    end

end
