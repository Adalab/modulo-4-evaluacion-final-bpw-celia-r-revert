//Importar bibliotecas
const express = require('express');
const cors = require('cors');
require('dotenv').config();
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
    console.log(connectionData);
    
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

//Petición GET para obtener el listado de datos de la tabla
app.get('/dragracebbdd', async (req, res) => {

    const conn = await getConnection(); 

    const [results] = await conn.query(`SELECT * FROM dragracebbdd.concursantes;`);

    await conn.end();

    const numOfElements = results.length; 

    res.json({
        info: { count: numOfElements }, //número de elementos
        results: results, //listado
    });
});

//Petición GET para obtener un resultado de los datos de la tabla
app.get('/dragracebbdd/:nombre_id', async (req, res) => {

    console.log(req.params);

    const conn = await getConnection(); 

    const [results] = await conn.query(`
        SELECT * 
            FROM dragracebbdd.concursantes
            WHERE nombre_id = ?;`, [req.params.nombre_id]);

    await conn.end();

    const numOfElements = results.length; 

    res.json(
        results[0], //listado
    );
});

//Petición POST para añadir datos
app.post('/dragracebbdd', async (req, res) => {

    console.log(req.body);

    //Condicionales para comprobar que vienen los parámetros obligatorios

    try {
        const conn = await getConnection(); 

        const [results] = await conn.execute(`
            INSERT INTO concursantes (nombre, ciudad_origen) 
            VALUES (?, ?, ?, ?);`
            [req.body.nombre, req.body.ciudad_natal, req.body.retos_ganados, req.body.expulsion]);

    await conn.end(); 

    res.json({
        "sucess": true,
        "id": results.insertId // id que generó MySQL para la nueva fila
    });

    }
    catch(err) {
        res.status(500).json({
            "success": false,
            "message": err.toString()
        })
    }
  
});

//Petición UPDATE para añadir datos
app.put('/dragracebbdd/:nombre_id', async (req, res) => {

    console.log(req.body);

    //Condicionales para comprobar que vienen los parámetros obligatorios

    try {
        const conn = await getConnection(); 

        const [results] = await conn.execute(`
            UPDATE concursantes (nombre, ciudad_origen, retos_ganados, expulsion)
                SET nonbre = ?, ciudad_origen = ?, retos_ganados = ?, expulsion = ?
                WHERE nombre_id:?);`,
            [req.body.nombre, req.body.ciudad_natal, req.body.retos_ganados, req.body.expulsion, req.params.nombre_id]);

    await conn.end(); 

    res.json({
        "sucess": true,
    });

    }
    catch(err) {
        res.status(500).json({
            "success": false,
            "message": err.toString()
        })
    }
  
});

//Petición DELETE para añadir datos
app.delete('/dragracebbdd/:nombre_id', async (req, res) => {

    console.log(req.body);

    //Condicionales para comprobar que vienen los parámetros obligatorios

    try {
        const conn = await getConnection(); 

        const [results] = await conn.execute(`
            DELETE concursantes (nombre, ciudad_origen, retos_ganados, expulsion)
                SET nonbre = ?, ciudad_origen = ?, retos_ganados = ?, expulsion = ?
                WHERE nombre_id:?);`,
            [req.body.nombre, req.body.ciudad_natal, req.body.retos_ganados, req.body.expulsion, req.params.nombre_id]);

    await conn.end(); 

    res.json({
        "sucess": true,
    });

    }
    catch(err) {
        res.status(500).json({
            "success": false,
            "message": err.toString()
        })
    }
  
});
