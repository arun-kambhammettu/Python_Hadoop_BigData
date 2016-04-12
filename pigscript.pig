--pig -useHCatalog -x local -f pigscript.pig
REGISTER '/root/final_project_ASJ/pigscript.py' USING streaming_python AS udfs;
actual = LOAD 'mydb.flightdetails_orc' USING org.apache.hive.hcatalog.pig.HCatLoader();
transformed = FILTER actual BY originalcity == 'Ottawa' AND destinationcity == 'Dhaka';
udfed = FOREACH transformed GENERATE flightnumber,carrier,originalcity,destinationcity,udfs.currencyConverter(fareindollars) AS rupees;
ordered = ORDER udfed BY rupees DESC;
topten = LIMIT ordered 10;

STORE topten INTO 'output/first_report_output' USING PigStorage(',');
