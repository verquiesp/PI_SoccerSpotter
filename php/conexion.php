<?php
    function get_connection(){
            $server="db4free.net";
            $dataBase="soccerspotter";
            $username="verquiesp";
            $password="verquiesp";
            $port="3306";

            $conect= mysqli_connect($server, $username, $password, $dataBase, $port);
            
            if(!$conect){
                die("Conexión fallida: ". mysqli_connect_errno());
            } 
            return json_encode(array("conexion" => $conect));
    }

    ?>