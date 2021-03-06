# DOMESTIC TRADE
# LANGUAGE: RUBY

# You have been hired by a trade company to write a program.

# They have given you a CSV (comma separated value, used in spreadsheets) file containing sales data by transaction
#for 10,000 sales transactions.

# Write a function that calculates the grand total of sales for a given item across all stores.

# Your output should be in a form of a hash, with total_KSH as a key and the total as a value.

# Additionally, the company wants to know which store location made the largest sales for that item. Add that as another hash key-value pair.

# Notes:
#  - Check out this website for an intro to handling CSV files: http://www.sitepoint.com/guide-ruby-csv-library-part/

# Example:

#   Given a `TRANS.csv` of:

#   store,sku,amount
#   Nairobi,DM1210,7000 KSH
#   Nairobi,DM1182,1968 KSH
#   Naivasha,DM1182,5858 KSH
#   Mombasa,DM1210,6876 KSH
#   Nakuru,DM1182,5464 KSH

# If we enter 'DM1182', you program should return:
# {:total_KSH=> 13290, :largest=> 'Nairobi'}.

$LOAD_PATH << '.'
require 'csv'

def domestic_trade(itemId)
  total = 0
  location = ""
  item = {}
  largest_sale = 0

 CSV.foreach('TRANS.csv') do |row|
   if row[1] == itemId
     total += row[2].to_i
     if row[2].to_i > largest_sale
       largest_sale = row[2].to_i
       location = row[0]
     end
   end
 end

  item = {:total_KSH => total, :largest => location}
end

puts domestic_trade("DM1182")
