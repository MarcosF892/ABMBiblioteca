<?php 
include_once "menu.php";
$mysqli = include_once "conexion1.php";

  $resultado = $mysqli->query('SELECT * FROM Categorias');
  $categorias = $resultado->fetch_all(MYSQLI_ASSOC);

  foreach ($categorias as $cat) {
    $resultado = $mysqli->query('SELECT * FROM Libros WHERE idCategoria='.$cat['id']);
    $libros = $resultado->fetch_all(MYSQLI_ASSOC);

    if ($libros) {
      echo '<div class="row"><div class="col-12">';
      echo '<h3 class="border-bottom border-3 pt-3">Categoría: '.$cat['nombre'].'</h3>';
      echo '</div></div>';
    }

  echo '<div class="row">';
    foreach ($libros as $libro) {
      echo '<div class="col-xl-3 col-lg-4 col-md-6 col-sm-12">';
      echo '<div class="card my-3">';
      echo '<img class="card-img-top" src="portadas/'.$libro['portada'].'" alt="Card image">';
      echo '<div class="card-body">';
      echo '<h4 class="card-title">'.$libro['nombre'].'</h4>';
      echo '<p class="card-text"></p>';
      echo '<a href="detalle_libro.php?id='.$libro['id'].'" class="btn btn-primary">Ver más</a>';
      echo '</div>';
      echo '</div>';
      echo '</div>';
    }
    echo '</div>';
  }
  include_once "pie1.php";
 ?>