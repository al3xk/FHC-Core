<?php
class Dms_model extends DB_Model
{

	/**
	 * Constructor
	 */
	public function __construct()
	{
		parent::__construct();
		$this->dbTable = 'campus.tbl_dms';
		$this->pk = 'dms_id';
	}
}
