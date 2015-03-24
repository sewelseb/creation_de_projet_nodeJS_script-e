#!/bin/bash


echo "j'espere que tu es dans le bon dossier, si non: ctrl+C \n"

echo "nom du projet:"
read nomProjet

echo "creation du dossier du projet"
sudo mkdir $nomProjet
sudo mkdir $nomProjet"/Public"
sudo mkdir $nomProjet"/Public/css"
sudo mkdir $nomProjet"/Public/js"
sudo mkdir $nomProjet"/Vues"

echo "creation de package.json"
sudo echo  -e "{ \n \"name\":\""$nomProjet" \", \n  \"version\":\"0.1.0 \", \n \"dependencies \":{\n}\n} " >> $nomProjet"/package.json"

echo "installation des modules"
npm install express
npm install swig
npm install mongoose


app="var http= require('http');\n "
app=$app"var url = require("url");\n"
app=$app"var express = require ('express');\n"
app=$app"var swig  = require('swig');\n"
app=$app"var path = require('path');\n"
app=$app"var mongoose = require('mongoose');\n"

app=$app"var app = express();\n
app.use(express.static(path.join(__dirname, 'public')));
\n"
app=$app"app.get('/',  function(req, res) {\n


        res.writeHead(200, {"Content-Type": "text/html"});\n

        res.end();\n

});\n"
app=$app"app.use(function (req, res){\n
        res.setHeader('Content-Type', 'text/plain');\n
    res.send(404, 'Perdu?');\n
});\n"

app=$app"app.listen(3000, function(){\n
        console.log('serveur en fonctionement');\n
})\n"

sudo echo -e $app >> $nomProjet"/app.js"
