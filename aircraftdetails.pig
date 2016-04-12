--pig -useHCatalog -x local -f aircraftdetails.pig
flight = LOAD 'mydb.flightdetails_orc' USING org.apache.hive.hcatalog.pig.HCatLoader();
aircraft = LOAD 'mydb.aircraftdetails_orc' USING org.apache.hive.hcatalog.pig.HCatLoader();
transformed = JOIN flight BY flightnumber,aircraft BY flightnumber;
filtered = FOREACH transformed GENERATE flight::flightnumber,enginename,businessseats,economyseats;

STORE filtered INTO 'output/second_report_output' USING PigStorage(',');
