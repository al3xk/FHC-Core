<?php
class Variable_model extends DB_Model
{

	/**
	 * Constructor
	 */
	public function __construct()
	{
		parent::__construct();
		$this->dbTable = 'public.tbl_variable';
		$this->pk = array('uid', 'name');
	}
}
