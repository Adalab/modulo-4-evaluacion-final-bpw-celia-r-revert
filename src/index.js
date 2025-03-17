//Importar bibliotecas
const express = require('express');
const cors = require('cors');
const { count } = require('console');
const mysql = require('mysql2/promise');

async function getConnection() {
    const connectionData = {
        host: process.env["MYSQL_HOST"],
        port: process.env["MYSQL_PORT"],
        user: process.env["MYSQL_USER"],
        password: process.env["MYSQL_PASS"],
        database: process.env["MYSQL_SCHEMA"],
    };

    const connection = await mysql.createConnection(connectionData);
    await connection.connect();
    return  connection;
    
};



//Configuración del servidor 
const app = express();

app.use(cors());
app.use(express.json());


//Arranque del servidor
const port = 3000;

app.listen(port, () => {
  console.log(`Example app listening on <http://localhost:${port}>`);
});

//Primer endpoint
app.get('/dragracebbdd', async (req, res) {

    const conn = await getConnection(); 

    const results = []; 
    const numOfElements = results.length; 

    res.json({
        info: { count: numOfElements }, //número de elementos
        results: results, //listado
    });
});