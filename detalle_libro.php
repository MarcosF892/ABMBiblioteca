<?php 
include_once "menu.php";
$mysqli = include_once "conexion1.php";

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $sentencia = $mysqli->prepare("SELECT l.id, l.nombre, l.editorial, l.anio, l.idioma, l.nPaginas, l.idCategoria, l.tema, l.portada, c.nombre categoria, a.nombre autor FROM libros l 
      INNER JOIN autores a ON a.id=l.idAutor 
      INNER JOIN categorias c ON c.id=l.idCategoria 
      WHERE l.id = ?");

    $sentencia->bind_param("i", $id);
    $sentencia->execute();
    $resultado = $sentencia->get_result();
    $libro = $resultado->fetch_assoc();


    $sentencia->bind_param("i", $libro['idCategoria']);
    $sentencia->execute();
    $resultado = $sentencia->get_result();
    $similares = $resultado->fetch_all(MYSQLI_ASSOC);
 ?>

 <div class="row">
      <div class="col-lg-6 col-xs-12 mb-4">
        <img class="img-fluid mb-4" style="width:100%;" src="portadas/<?php echo $libro['portada'];?>" alt="libro">
      </div>

     <div class="col-lg-6 col-xs-12">
        <h3><?php echo $libro['nombre'];?></h3>
        <h5>Editorial: <?php echo $libro['editorial'];?></h5>
        <h5>Autor: <?php echo $libro['autor'];?></h5>
        <h5>Año: <?php echo $libro['anio'];?></h5>
        <h5>Idioma: <?php echo $libro['idioma'];?></h5>
        <h5>Cantidad de paginas: <?php echo $libro['nPaginas'];?></h5>
        <h5>Categoria: <?php echo $libro['categoria'];?></h5>
        <br>
        <h3>Reseña</h3>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
        <form class="" action="reservar_libro.php" method="get">
          <div class="row">
            <div class="col-2">
              <input type="text" class="form-control" placeholder="cantidad" name="cantidad" value="1">
              <input type="hidden" name="id" value="<?php echo $libro['id'];?>">
            </div>
            <div class="col-10">
              <button type="submit" class="btn btn-success mb-3">Agregar al carrito</button>
            </div>
          </div>
        </form>
       </div>
</div>

<?php include_once "pie1.php" ?>
<?php } ?>

