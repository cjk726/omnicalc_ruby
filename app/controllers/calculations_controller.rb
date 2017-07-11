class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================


    @word_count = @text.split.count

    @character_count_with_spaces = @text.length

    @character_count_without_spaces = @text.gsub(/\s+/, "").length

    @phrase_split = @text.split                        # Create an array of words
    @occurrences=@phrase_split.count(@special_word)    # Count the occurrences of the special word within the array


    # ================================================================================
    # (Your code goes above.
    # ================================================================================

    render("word_count.html.erb")
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

    # Loan Payment = Amount / Discount Factor
    # P = A / D

    # Number of Periodic Payments (n) = Payments per year times number of years
    number_payments = @years.to_f * 12
    # Periodic Interest Rate (i) = Annual rate divided by number of payments per
    periodic_interest_rate = (@apr.to_f / 100) / 12 

    # Discount Factor (D) = {[(1 + i) ^n] - 1} / [i(1 + i)^n]
    discount_factor = (((1+periodic_interest_rate)**number_payments)-1) / ((periodic_interest_rate)*(1+periodic_interest_rate)**number_payments)
    
    # P = A / D
    @principal=@principal.to_f
    discount_factor=discount_factor.to_f
    @monthly_payment = @principal / discount_factor

    # Assume you borrow $100,000 at 6% for 30 years to be repaid monthly. What is the monthly payment?
    #  n = 360 (30 years times 12 monthly payments per year)
    #  i = .005 (6% annually expressed as .06, divided by 12 monthly payments per year - learn how to convert percentages to decimal format)
    #  D = 166.7916 ({[(1+.005)^360] - 1} / [.005(1+.005)^360])
    #  P = A / D = 100,000 / 166.7916 = 599.55

    

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment.html.erb")
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    

    # Can't get the dropdown calendar button to work but copy & pasting in dates works

    @seconds = @ending - @starting
    @minutes = @seconds.to_f / 60
    @hours = @minutes / 60
    @days = @hours / 24
    @weeks = @days / 7
    @years = @days / 365.25
    

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between.html.erb")
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @numbers.max - @numbers.min

    if 
      @count.odd?
      @median = @sorted_numbers[(@count-1)/2]
    else
      @median = (@sorted_numbers[(@count-1)/2] + @sorted_numbers[(@count)/2])/2
    end

    @sum = @numbers.sum

    @mean = @numbers.sum.to_f / @numbers.count.to_f

    numbers_minus_mean = []
    @numbers.each do |num|
      delta = (num - @mean)**2
      numbers_minus_mean.push(delta)
    @variance = numbers_minus_mean.sum / @count
    end
    
    @standard_deviation = @variance**0.5

# Struggling with Mode. Trying to count the occurrences of each num then find the location of the largest count and map it back to its num.
    modecounts = []
     @numbers.each do |num|
      @numbers.count(num)
      modecounts.push(num)
      end
    #@mode = modecounts.max  

    
    

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
  end
end
