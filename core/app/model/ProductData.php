<?php
class ProductData {
	public static $tablename = "product";

	public function ProductData(){
		$this->name = "";
		$this->price_in = "";
		$this->price_out = "";
		$this->price_mayor = "";
		$this->unit = "";
		$this->user_id = "";
		$this->image = "";
		$this->presentation = "0";
		$this->created_at = "NOW()";
	}

	public function getProvider(){ return ProviderData::getById($this->idproveedor);}
	public function getCategory(){ return CategoryData::getById($this->category_id);}

	public function add(){
		$sql = "insert into ".self::$tablename." (idproveedor,image,kind,code,brand_id,barcode,name,description,price_in,price_out,price_mayor,user_id,presentation,unit,category_id,inventary_min,created_at) ";
		$sql .= "value ($this->idproveedor,\"$this->image\",\"$this->kind\",\"$this->code\",$this->brand_id,\"$this->barcode\",\"$this->name\",\"$this->description\",\"$this->price_in\",\"$this->price_out\",\"$this->price_mayor\",$this->user_id,\"$this->presentation\",\"$this->unit\",$this->category_id,$this->inventary_min,NOW())";
		return Executor::doit($sql);
	}


	public static function delById($id){
		$sql = "delete from ".self::$tablename." where id=$id";
		Executor::doit($sql);
	}
	public function del(){
		$sql = "delete from ".self::$tablename." where id=$this->id";
		Executor::doit($sql);
	}

// partiendo de que ya tenemos creado un objecto ProductData previamente utilizamos el contexto
	public function update(){
		$sql = "update ".self::$tablename." set barcode=\"$this->barcode\",idproveedor=$this->idproveedor,name=\"$this->name\",price_in=\"$this->price_in\",price_out=\"$this->price_out\",price_mayor=\"$this->price_mayor\",unit=\"$this->unit\",presentation=\"$this->presentation\",category_id=$this->category_id,inventary_min=\"$this->inventary_min\",description=\"$this->description\",is_active=\"$this->is_active\",code=\"$this->code\",brand_id=$this->brand_id where id=$this->id";
		Executor::doit($sql);
	}

	public function del_category(){
		$sql = "update ".self::$tablename." set category_id=NULL where id=$this->id";
		Executor::doit($sql);
	}


	public function update_image(){
		$sql = "update ".self::$tablename." set image=\"$this->image\" where id=$this->id";
		Executor::doit($sql);
	}

	public function update_prices(){
		$sql = "update ".self::$tablename." set price_in=\"$this->price_in\",price_out=\"$this->price_out\" where id=$this->id";
		Executor::doit($sql);
	}

	public static function getById($id){
		$sql = "select * from ".self::$tablename." where id=$id";
		$query = Executor::doit($sql);
		return Model::one($query[0],new ProductData());

	}



	public static function getAll(){
		$sql = "select * from ".self::$tablename;
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}

	public static function getAllByCategoryId($id){
		$sql = "select * from ".self::$tablename." where category_id=$id";
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}

	public static function getAllByPage($start_from,$limit){
		$sql = "select * from ".self::$tablename." where id>=$start_from limit $limit";
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}


	public static function getLike($p){
		$sql = "select * from ".self::$tablename." where code like '%$p%' or barcode like '%$p%' or name like '%$p%' or id like '%$p%'";
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}


	public static function getLike2($p){
		$sql = "select * from ".self::$tablename." where (code like '%$p%' or barcode like '%$p%' or name like '%$p%' or id like '%$p%') and kind=1";
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}


	public static function getAllByUserId($user_id){
		$sql = "select * from ".self::$tablename." where user_id=$user_id order by created_at desc";
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}

}

?>