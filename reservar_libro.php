<?php 
include_once "menu.php";
$mysqli = include_once "conexion1.php";

if (isset($_POST['borrarcarro'])) {
  unset($_SESSION['resId']);
  unset($_SESSION['resNombre']);
} else {
  if (!isset($_SESSION['resId'])) {
    $resId = array();
    $resNombre = array();
    $_SESSION['resId'] = $resId;
    $_SESSION['resNombre'] = $resNombre;
  } else {
    if (isset($_GET['id']) && isset($_GET['nombre'])) {
      array_push($_SESSION['resId'],$_GET['id']);
      array_push($_SESSION['resNombre'],$_GET['nombre']);
    }
  }
 ?>

 <table class="table table-hover">
  <thead>
    <th class="table-cell">Id</th>
    <th class="table-cell">Libro</th>
  </thead>
  <tbody>

 <?php
    for ($i=0; $i < count($_SESSION['resId']); $i++) {
      echo '<tr>';
      echo '<td class="table-cell">'.$_SESSION['resId'][$i].'</td>';
      echo '<td class="table-cell">'.$_SESSION['resNombre'][$i].'</td>';
      echo '</tr>';
    }
  }
  ?>

  </tbody>
</table>

<form class="" action="reservar_libro.php" method="post">
  <input class="btn btn-success my-3" type="submit" name="borrarcarro" value="Borrar carro">
</form>

<?php include_once "pie1.php";?>