<?php

	if (count($_POST)>0) {

		$deposit = new DepositsData();
		$deposit ->idproveedor=$_POST["idproveedor"];
		$deposit ->monto = $_POST["monto"];
		$deposit ->descripcion = $_POST["descripcion"];
		$deposit->update();

		print "<script>window.location='index.php?view=depositos';</script>";
	}



?>