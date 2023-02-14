//Initial setup
var express = require('express');
var app = express();
var port = 3006;
//setup for https usage
var https = require('https')
var fs = require('fs')

//Define routers for different sub-domains
var Collatzrouter = require('./src/routes/collatz');

//Import certificates
const serverOptions = {
 key: fs.readFileSync('certs/privatekey.pem'),
 cert: fs.readFileSync('certs/certificate.pem')
};

//Setup static directory to find resources
app.use(express.static('public'));

app.set('views','./src/views');
app.set('view engine', 'ejs');

//Look at request that comes in

app.use('/collatz', Collatzrouter)

// handle default domain request
app.get('/');

//https version of the listen
https.createServer(serverOptions, app).listen(port, function(err){
    console.log('The server is running on port: ' + port);
});
