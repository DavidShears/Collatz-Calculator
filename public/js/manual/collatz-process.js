function collatzcalc(){
    // Start off by getting input value
    var StartValue = document.getElementById("Start").value;
    var Steps = 0;
    var resultstext = "";

    // Test if we've been given a number, if not then no point doing anything else
    if (isNaN(StartValue) || StartValue == '') {
        document.getElementById("results").value = "Not a number";
    }
    else {
    // Actual processing of calculation
    // No point processing if we've been given < 1 as a value
        if (StartValue >= 1)
        {
            var Conjecture = function(value,callback)
            {
                var outvalue = 0;
                var remain = value % 2;
                if (remain != 0) {
                    var outvalue = (value * 3) + 1;
                    return callback(outvalue);
                }
                else {
                    var outvalue = value / 2;
                    return callback(outvalue);
                }
            }
            do {
                Steps ++;
                Conjecture(StartValue,function(outvalue){
                    resultstext += "Step Number: " + Steps + ", results in value: " + outvalue + "\n";
                    StartValue = outvalue;
                });
            }
            while (StartValue != 1);
            document.getElementById("results").value = resultstext;
        }
        // We've been given a number < 1 so cannot process
        else {
            document.getElementById("results").value = "No processing, invalid start number";
        }
    }
}