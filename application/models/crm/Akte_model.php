<?php
class Akte_model extends DB_Model
{

	/**
	 * Constructor
	 */
	public function __construct()
	{
		parent::__construct();
		$this->dbTable = 'public.tbl_akte';
		$this->pk = 'akte_id';
	}
}
