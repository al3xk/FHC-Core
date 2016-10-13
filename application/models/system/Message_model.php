<?php 

if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Message_model extends DB_Model
{
	/**
	 * Constructor
	 */
	public function __construct()
	{
		parent::__construct();
		$this->dbTable = 'public.tbl_msg_message';
		$this->pk = 'message_id';
	}
	
	/**
	 * Get all sent messages from a person identified by person_id
	 */
	public function getMessagesByPerson($person_id, $all)
	{
		// Checks if the operation is permitted by the API caller
		if (($chkRights = $this->isEntitled('public.tbl_msg_message', PermissionLib::SELECT_RIGHT, FHC_NORIGHT, FHC_MODEL_ERROR)) !== true)
			return $chkRights;
		if (($chkRights = $this->isEntitled('public.tbl_person', PermissionLib::SELECT_RIGHT, FHC_NORIGHT, FHC_MODEL_ERROR)) !== true)
			return $chkRights;
		if (($chkRights = $this->isEntitled('public.tbl_msg_status', PermissionLib::SELECT_RIGHT, FHC_NORIGHT, FHC_MODEL_ERROR)) !== true)
			return $chkRights;
		
		$sql = 'SELECT m.message_id,
						m.person_id,
						m.subject,
						m.body,
						m.priority,
						m.insertamum,
						m.relationmessage_id,
						m.oe_kurzbz,
						p.anrede,
						p.titelpost,
						p.titelpre,
						p.nachname,
						p.vorname,
						p.vornamen,
						s.status,
						s.statusinfo,
						s.insertamum AS statusamum
				  FROM public.tbl_msg_message m JOIN public.tbl_person p ON (p.person_id = m.person_id)
						LEFT JOIN (
							SELECT message_id, person_id, status, statusinfo, insertamum
							  FROM public.tbl_msg_status
							 %s
						  ORDER BY insertamum DESC
						) s ON (m.message_id = s.message_id AND m.person_id = s.person_id)
				 WHERE m.person_id = ?';
		
		$parametersArray = array($person_id);
		
		if ($all == 'true')
		{
			$sql = sprintf($sql, '');
		}
		else
		{
			$sql = sprintf($sql, 'WHERE status >= 3');
		}
		
		$result = $this->db->query($sql, $parametersArray);
		if (is_object($result))
			return success($result->result());
		else
			return error($this->db->error(), FHC_DB_ERROR);
	}
}