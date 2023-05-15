<?php
            include 'conexion.php';

            if(isset($_POST['submit'])){
                $nombre = $_POST['nombre'];
                $apellidos = $_POST['apellidos'];
                $edad = $_POST['edad'];
                $equipo = $_POST['equipo'];

                $query = "INSERT INTO Jugadores (nombre, apellidos, edad, idequipo) VALUES ('$nombre', '$apellidos', '$edad', '$equipo')";
                $result = mysqli_query($conect, $query);

                if($result){
                    echo "Jugador agregado correctamente";
                } else {
                    echo "Error al agregar jugador: " . mysqli_error($conect);
                }

                mysqli_close($conect);
            }
        ?>