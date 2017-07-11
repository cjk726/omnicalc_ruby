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

    @seconds = "Replace this string with your answer."
    @minutes = "Replace this string with your answer."
    @hours = "Replace this string with your answer."
    @days = "Replace this string with your answer."
    @weeks = "Replace this string with your answer."
    @years = "Replace this string with your answer."

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

    @sorted_numbers = "Replace this string with your answer."

    @count = "Replace this string with your answer."

    @minimum = "Replace this string with your answer."

    @maximum = "Replace this string with your answer."

    @range = "Replace this string with your answer."

    @median = "Replace this string with your answer."

    @sum = "Replace this string with your answer."

    @mean = "Replace this string with your answer."

    @variance = "Replace this string with your answer."

    @standard_deviation = "Replace this string with your answer."

    @mode = "Replace this string with your answer."

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
  end
end
