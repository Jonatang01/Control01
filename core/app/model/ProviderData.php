<?php
class ProviderData {
	public static $tablename = "provider";


	public function ProviderData(){
		$this->nombre = "";
		$this->direccion = "";
		$this->telefono = "";
		$this->email = "";
	}

	public function add(){
		$sql = "insert into provider (nombre,direccion,telefono,email) ";
		$sql .= "value (\"$this->nombre\",\"$this->direccion\",\"$this->telefono\",\"$this->email\")";
		Executor::doit($sql);
	}

	/*public function add_provider(){
		$sql = "insert into person (no,name,lastname,address1,email1,phone1,kind,created_at) ";
		$sql .= "value (\"$this->no\",\"$this->name\",\"$this->lastname\",\"$this->address1\",\"$this->email1\",\"$this->phone1\",2,$this->created_at)";
		Executor::doit($sql);
	}*/


	public static function delById($id){
		$sql = "delete from ".self::$tablename." where id=$id";
		Executor::doit($sql);
	}
	public function del(){
		$sql = "delete from ".self::$tablename." where id=$this->id";
		Executor::doit($sql);
	}

// partiendo de que ya tenemos creado un objecto ProviderData previamente utilizamos el contexto
	public function update(){
		$sql = "update ".self::$tablename." set nombre=\"$this->nombre\",direccion=\"$this->direccion\",telefono=\"$this->telefono\",email=\"$this->email\" where id=$this->id";
		Executor::doit($sql);
	}






	public static function getById($id){
		$sql = "select * from ".self::$tablename." where id=$id";
		$query = Executor::doit($sql);
		return Model::one($query[0],new ProviderData());
	}



	public static function getAll(){
		$sql = "select * from ".self::$tablename;
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProviderData());

	}





	public static function getLike($q){
		$sql = "select * from ".self::$tablename." where name like '%$q%'";
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProviderData());

	}

	public static function getGroupByDateOp($start,$end){
 		$sql = "select *,sum(price) as t from ".self::$tablename." where date(created_at) >= \"$start\" and date(created_at) <= \"$end\"";
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProviderData());

		 }

}

?>