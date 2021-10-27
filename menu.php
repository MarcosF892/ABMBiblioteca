<?php
  session_start();
  if (isset($_SESSION['usuario'])) {
    $usuarioActual = $_SESSION['usuario'];
  } else {
    $usuarioActual = 'Usuario';
  }
?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Biblioteca</title>
  <link rel="stylesheet" type="text/css" href="diseño/diseño1.css">
  <meta name="viewport" content="width=device-width, inicial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
</head>
<body>
  <nav style="background-color: rgba(0, 0, 0, 0.9);" class="navbar mb-3 sticky-top navbar-dark navbar-expand-lg">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">Inicio</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#barra">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="barra">
          <ul class="nav nav-tabs me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link" href="libros.php">Libros</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="reservar_libro.php">Carrito</a>
            </li>
          </ul>

          <ul class="nav navbar-nav ms-auto">
            <li class="nav-item">
              <a class="nav-link" href="<?php echo 'login1.php';?>"><?php echo $usuarioActual; ?></a>
            </li>
          </ul>

          
        
        </div>

      </div>
    </nav>

    <div class="container">