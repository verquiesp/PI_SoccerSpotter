<?php
    include 'conexion.php';
    $email = utf8_decode($_POST['email']);
    $password = md5($_POST['password']);

    $query = "INSERT INTO Usuarios (email, password, role) VALUES ('$email', '$password', 'user')";
    $result = mysqli_query($conect, $query);

    if($result){
        echo "Usuario registrado correctamente";
    } else {
        echo "Error al registrar el usuario: " . mysqli_error($conect);
    }

    mysqli_close($conect);
?>