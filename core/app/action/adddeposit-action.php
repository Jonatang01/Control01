<?php

if(count($_POST)>0){
	$user = new DepositsData();
	$user->idproveedor=$_POST["idproveedor"]!=""?$_POST["idproveedor"]:"NULL";
	$user->monto = $_POST["monto"];
	$user->descripcion = $_POST["descripcion"];
	$user->add();

print "<script>window.location='index.php?view=depositos';</script>";


}


?>