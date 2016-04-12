We have two data files flightdata.csv which we gathered from external source and aircraftdetails.csv which we created as a second input file.

# flightdetails.hive
# Read flightdetails.csv file located at /root/final_project_ASJ/data/flightdetails.csv
# Save the file as an ORC file i.e., flightdetails_orc
# To run the hive script that stores flightdata.csv file as an ORC file use the below command :
  hive -f flightdetails.hive

# To run the pig script that generates our first report, please use the below command : 
  pig -useHCatalog -x local -f pigscript.pig


# aircraftdetails.hive
# Read aircraftdetails.csv file located at /root/final_project_ASJ/data/aircraftdetails.csv
# Save the file as an ORC file i.e., aircraftdetails_orc
# To run the hive script that stores aircraftdetails.csv file as an ORC file use the below command : 
  hive -f aircraftdetails.hive

# To run the pig script that generates our second report, please use the below command : 
  pig -useHCatalog -x local -f aircraftdetails.pig

# UDF : We have created a user defined function using Python, which converts the fare in dollars to Indian rupees.
# To view the UDF, please use the command : vi pigscript.py

# First Report:
# Summary: List the flight number,carrier,original city,destination city and fare for all the flights originating from Ottawa city and reaching Dhaka city. Display fare in Indian rupees and arrange the results in descending order of the fare.

# Value: List of top ten flight details from Ottawa city to Dhaka city with fare in Indian rupees will be useful for people in India who are looking for flight fares.

# Second Report:
# Summary: For all the matching flight numbers between the two input files(flightdetails_orc and aircraftdetails_orc),list the corresponding aircraft’s flight number, engine name,economy seats and business seats.

# Value: This report will be useful for the people of airline company to look for aircraft specific details.