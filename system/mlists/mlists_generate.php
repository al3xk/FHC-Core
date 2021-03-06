<?php
/* Copyright (C) 2008 Technikum-Wien
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307, USA.
 *
 * Authors: Christian Paminger <christian.paminger@technikum-wien.at>,
 *          Andreas Oesterreicher <andreas.oesterreicher@technikum-wien.at> and
 *          Rudolf Hangl <rudolf.hangl@technikum-wien.at>.
 */
/****************************************************************************
 * Script: 			mlists_generate.php
 * Descr:  			Das Skript generiert Mailinglisten in der Datenbanken
 *					fuer Einheiten, Lektoren und  fix Angestellte.
 * Author: 			Christian Paminger
 * Erstellt: 		12.9.2005
 * Update: 			14.9.2005 von Christian Paminger
 *****************************************************************************/

require_once('../../config/vilesci.config.inc.php');
require_once('../../include/functions.inc.php');
require_once('../../include/studiensemester.class.php');
require_once('../../include/organisationseinheit.class.php');
require_once('../../include/gruppe.class.php');
require_once('../../include/basis_db.class.php');

$error_msg='';
?>

<HTML>
<HEAD>
	<TITLE>Mailinglisten</TITLE>
	<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<LINK rel="stylesheet" href="../../skin/vilesci.css" type="text/css">
</HEAD>
<BODY>
	<H3>MailingListen abgleich</H3>
	<?php
	if (!$db = new basis_db())
 		die('Fehler beim Oeffnen der Datenbankverbindung');

   	// aktuelles Studiensemester ermitteln
	$sql_query="SELECT studiensemester_kurzbz FROM public.vw_studiensemester ORDER BY delta LIMIT 1";
	if(!($result = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error();
	if($row = $db->db_fetch_object($result))
		$studiensemester=$row->studiensemester_kurzbz;
	else
		$error_msg.= $db->db_last_error().$sql_query;

	$stsem_obj = new studiensemester();

	/*
	if(mb_substr($studiensemester,0,1)=='W')
		$stsem2 = $stsem_obj->getPreviousFrom($studiensemester);
	else
		$stsem2 = $stsem_obj->getNextFrom($studiensemester);
	*/
	$stsem2 = $stsem_obj->getNearestFrom($studiensemester);

	function setGeneriert($gruppe)
	{
		$db = new basis_db();
		$qry = "UPDATE public.tbl_gruppe SET generiert=true WHERE UPPER(gruppe_kurzbz)=UPPER('".addslashes($gruppe)."')";
		$db->db_query($qry);
	}

   	// **************************************************************
	// MitarbeiterInnenVerteiler abgleichen
	$mlist_name='tw_ma';
	setGeneriert($mlist_name);
	// MitarbeiterInnen holen die nicht mehr in den Verteiler gehoeren
	echo $mlist_name.' wird abgeglichen!<BR>';
	flush();
	$sql_query="SELECT uid FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER('".addslashes($mlist_name)."') AND uid NOT IN (SELECT mitarbeiter_uid FROM public.tbl_mitarbeiter JOIN public.tbl_benutzer ON (mitarbeiter_uid=uid) WHERE aktiv AND personalnummer >=0)";

	if(!($result = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error();

	while($row = $db->db_fetch_object($result))
	{
     	$sql_query="DELETE FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER('$mlist_name') AND uid='$row->uid'";
		if(!$db->db_query($sql_query))
			$error_msg.=$db->db_last_error().$sql_query;
		echo '-';
		flush();
	}
	// MitarbeiterInnen holen die nicht im Verteiler sind
	echo '<BR>';
	$sql_query="SELECT mitarbeiter_uid AS uid FROM public.tbl_mitarbeiter JOIN public.tbl_benutzer ON (mitarbeiter_uid=uid) WHERE aktiv AND personalnummer >=0 AND mitarbeiter_uid NOT IN (SELECT uid FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER('$mlist_name'))";
	if(!($result = $db->db_query($sql_query)))
		$error_msg.= $db->db_last_error();
	while($row = $db->db_fetch_object($result))
	{
     	$sql_query="INSERT INTO public.tbl_benutzergruppe(uid, gruppe_kurzbz, insertamum, insertvon) VALUES ('$row->uid','".strtoupper($mlist_name)."', now(), 'mlists_generate')";
		if(!$db->db_query($sql_query))
			$error_msg.=$db->db_last_error().$sql_query;
		echo '-';
		flush();
	}

	// **************************************************************
	// Weibliche Mitarbeiterinnen Verteiler abgleichen
	$mlist_name='tw_ma_w';
	setGeneriert($mlist_name);
	// MitarbeiterInnen holen die nicht mehr in den Verteiler gehoeren
	echo $mlist_name.' wird abgeglichen!<BR>';
	flush();
	$sql_query="SELECT uid FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER(".$db->db_add_param($mlist_name).") AND uid NOT IN (SELECT mitarbeiter_uid FROM public.tbl_mitarbeiter JOIN public.tbl_benutzer ON (mitarbeiter_uid=uid) JOIN public.tbl_person USING(person_id) WHERE tbl_benutzer.aktiv AND geschlecht='w' AND personalnummer >=0)";

	if(!($result = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error();

	while($row = $db->db_fetch_object($result))
	{
     	$sql_query="DELETE FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER(".$db->db_add_param($mlist_name).") AND uid=".$db->db_add_param($row->uid);
		if(!$db->db_query($sql_query))
			$error_msg.=$db->db_last_error().$sql_query;
		echo '-';
		flush();
	}
	// MitarbeiterInnen holen die nicht im Verteiler sind
	echo '<BR>';
	$sql_query="SELECT mitarbeiter_uid AS uid FROM public.tbl_mitarbeiter JOIN public.tbl_benutzer ON (mitarbeiter_uid=uid) JOIN public.tbl_person USING(person_id) WHERE tbl_benutzer.aktiv AND geschlecht='w' AND personalnummer >=0 AND mitarbeiter_uid NOT IN (SELECT uid FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER(".$db->db_add_param($mlist_name)."))";
	if(!($result = $db->db_query($sql_query)))
		$error_msg.= $db->db_last_error();
	while($row = $db->db_fetch_object($result))
	{
     	$sql_query="INSERT INTO public.tbl_benutzergruppe(uid, gruppe_kurzbz, insertamum, insertvon) VALUES (".$db->db_add_param($row->uid).",".$db->db_add_param(strtoupper($mlist_name)).", now(), 'mlists_generate')";
		if(!$db->db_query($sql_query))
			$error_msg.=$db->db_last_error().$sql_query;
		echo '-';
		flush();
	}

	// **************************************************************
	// LektorenVerteiler abgleichen
	$mlist_name='tw_lkt';
	setGeneriert($mlist_name);
	// Lektoren holen die nicht mehr in den Verteiler gehoeren
	echo $mlist_name.' wird abgeglichen!<BR>';
	flush();
	$sql_query="SELECT uid FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER('".addslashes($mlist_name)."') AND uid NOT IN (SELECT mitarbeiter_uid FROM public.tbl_mitarbeiter JOIN public.tbl_benutzer ON (mitarbeiter_uid=uid) WHERE lektor AND aktiv)";

	if(!($result = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error();

	while($row = $db->db_fetch_object($result))
	{
     	$sql_query="DELETE FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER('$mlist_name') AND uid='$row->uid'";
		if(!$db->db_query($sql_query))
			$error_msg.=$db->db_last_error().$sql_query;
		echo '-';
		flush();
	}
	// Lektoren holen die nicht im Verteiler sind
	echo '<BR>';
	$sql_query="SELECT mitarbeiter_uid AS uid FROM public.tbl_mitarbeiter JOIN public.tbl_benutzer ON (mitarbeiter_uid=uid) WHERE lektor AND aktiv AND mitarbeiter_uid NOT LIKE '\\\\_%' AND mitarbeiter_uid NOT IN (SELECT uid FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER('$mlist_name'))";
	if(!($result = $db->db_query($sql_query)))
		$error_msg.= $db->db_last_error();
	while($row = $db->db_fetch_object($result))
	{
     	$sql_query="INSERT INTO public.tbl_benutzergruppe(uid, gruppe_kurzbz, insertamum, insertvon) VALUES ('$row->uid','".strtoupper($mlist_name)."', now(), 'mlists_generate')";
		if(!$db->db_query($sql_query))
			$error_msg.=$db->db_last_error().$sql_query;
		echo '-';
		flush();
	}

	// **************************************************************
	// Sekretariats-Verteiler abgleichen
	$mlist_name='tw_sek';
	setGeneriert($mlist_name);
	// Personen holen die nicht mehr in den Verteiler gehoeren
	echo $mlist_name.' wird abgeglichen!<BR>';
	flush();
	$sql_query="SELECT uid FROM public.tbl_benutzergruppe
				WHERE UPPER(gruppe_kurzbz)=UPPER('$mlist_name') AND
				uid NOT IN (SELECT mitarbeiter_uid
							FROM
								public.tbl_mitarbeiter
								JOIN public.tbl_benutzer ON (mitarbeiter_uid=uid)
								JOIN public.tbl_benutzerfunktion USING(uid)
							WHERE aktiv AND funktion_kurzbz='ass' AND
							(tbl_benutzerfunktion.datum_von is null OR tbl_benutzerfunktion.datum_von<=now()) AND
							(tbl_benutzerfunktion.datum_bis is null OR tbl_benutzerfunktion.datum_bis>=now()))";
	if(!($result = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error();
	while($row = $db->db_fetch_object($result))
	{
     	$sql_query="DELETE FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER('$mlist_name') AND uid='$row->uid'";
		if(!$db->db_query($sql_query))
			$error_msg.=$db->db_last_error().$sql_query;
		echo '-';
		flush();
	}
	// Personen holen die nicht im Verteiler sind
	echo '<BR>';
	$sql_query="SELECT distinct mitarbeiter_uid AS uid
				FROM
					public.tbl_mitarbeiter
					JOIN public.tbl_benutzer ON (mitarbeiter_uid=uid)
					JOIN public.tbl_benutzerfunktion USING(uid)
				WHERE
					aktiv AND
					tbl_benutzerfunktion.funktion_kurzbz='ass' AND
					(tbl_benutzerfunktion.datum_von is null OR tbl_benutzerfunktion.datum_von<=now()) AND
					(tbl_benutzerfunktion.datum_bis is null OR tbl_benutzerfunktion.datum_bis>=now()) AND
					mitarbeiter_uid NOT LIKE '\\\\_%' AND
					mitarbeiter_uid NOT IN (SELECT uid FROM public.tbl_benutzergruppe
											WHERE UPPER(gruppe_kurzbz)=UPPER('$mlist_name'))";
	if(!($result = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error();
	while($row=$db->db_fetch_object($result))
	{
     	$sql_query="INSERT INTO public.tbl_benutzergruppe(uid, gruppe_kurzbz, studiensemester_kurzbz, updateamum, updatevon, insertamum, insertvon) VALUES ('$row->uid','".strtoupper($mlist_name)."',null, null, null, now(), 'mlists_generate')";
		if(!$db->db_query($sql_query))
			$error_msg.=$db->db_last_error().$sql_query;
		echo '-';
		flush();
	}

	// **************************************************************
	// Studiengangsleiter-Verteiler abgleichen
	// Es werden auch StellvertreterInnen hinzugefügt
	$mlist_name='tw_stgl';
	setGeneriert($mlist_name);
	// Personen holen die nicht mehr in den Verteiler gehoeren
	echo $mlist_name.' wird abgeglichen!<BR>';
	flush();
	$sql_query="SELECT uid FROM public.tbl_benutzergruppe
				WHERE
					UPPER(gruppe_kurzbz)=UPPER('$mlist_name') AND
					uid NOT IN (SELECT mitarbeiter_uid
								FROM
									public.tbl_mitarbeiter
									JOIN public.tbl_benutzer ON (mitarbeiter_uid=uid)
									JOIN public.tbl_benutzerfunktion USING(uid)
									JOIN public.tbl_studiengang USING(oe_kurzbz)
								WHERE tbl_benutzer.aktiv AND (funktion_kurzbz='Leitung' OR funktion_kurzbz='gLtg' OR funktion_kurzbz='stvLtg') AND
								(tbl_benutzerfunktion.datum_von is null OR tbl_benutzerfunktion.datum_von<=now()) AND
								(tbl_benutzerfunktion.datum_bis is null OR tbl_benutzerfunktion.datum_bis>=now())
								AND tbl_studiengang.aktiv=true)";
	if(!($result = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error();
	while($row=$db->db_fetch_object($result))
	{
     	$sql_query="DELETE FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER('$mlist_name') AND uid='$row->uid'";
		if(!$db->db_query($sql_query))
			$error_msg.=$db->db_last_error().$sql_query;
		echo '-';
		flush();
	}
	// Personen holen die nicht im Verteiler sind
	echo '<BR>';
	$sql_query="SELECT DISTINCT mitarbeiter_uid AS uid
				FROM
					public.tbl_mitarbeiter
					JOIN public.tbl_benutzer ON (mitarbeiter_uid=uid)
					JOIN public.tbl_benutzerfunktion USING(uid)
					JOIN public.tbl_studiengang USING(oe_kurzbz)
				WHERE
					tbl_benutzer.aktiv AND
					(tbl_benutzerfunktion.funktion_kurzbz='Leitung' OR funktion_kurzbz='gLtg' OR funktion_kurzbz='stvLtg') AND
					(tbl_benutzerfunktion.datum_von is null OR tbl_benutzerfunktion.datum_von<=now()) AND
					(tbl_benutzerfunktion.datum_bis is null OR tbl_benutzerfunktion.datum_bis>=now()) AND
					mitarbeiter_uid NOT LIKE '\\\\_%' AND mitarbeiter_uid NOT IN (SELECT uid FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER('$mlist_name'))
					AND tbl_studiengang.aktiv=true";
	if(!($result = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error();
	while($row=$db->db_fetch_object($result))
	{
     	$sql_query="INSERT INTO public.tbl_benutzergruppe(uid, gruppe_kurzbz, studiensemester_kurzbz, updateamum, updatevon, insertamum, insertvon) VALUES ('$row->uid','".strtoupper($mlist_name)."',null, null, null, now(), 'mlists_generate')";
		if(!$db->db_query($sql_query))
			$error_msg.=$db->db_last_error().$sql_query;
		echo '-';
		flush();
	}

	// **************************************************************
	// Verteiler fuer alle fixAngestellten abgleichen
	$mlist_name='tw_fix';
	setGeneriert($mlist_name);
	// Lektoren holen die nicht mehr in den Verteiler gehoeren
	echo '<BR>'.$mlist_name.' wird abgeglichen!<BR>';
	flush();
	$sql_query="SELECT uid FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER('$mlist_name') AND uid NOT IN (SELECT mitarbeiter_uid FROM public.tbl_mitarbeiter JOIN public.tbl_benutzer ON(uid=mitarbeiter_uid) WHERE fixangestellt AND aktiv)";
	if(!($result = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error();
	while($row=$db->db_fetch_object($result))
	{
     	$sql_query="DELETE FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER('$mlist_name') AND uid='$row->uid'";
		if(!$db->db_query($sql_query))
			$error_msg.=$db->db_last_error().$sql_query;
		echo '-';
		flush();
	}
	// Lektoren holen die nicht im Verteiler sind
	echo '<BR>';
	$sql_query="SELECT mitarbeiter_uid AS uid FROM public.tbl_mitarbeiter JOIN public.tbl_benutzer ON(uid=mitarbeiter_uid) WHERE fixangestellt AND aktiv AND mitarbeiter_uid NOT LIKE '\\\\_%' AND mitarbeiter_uid NOT IN (SELECT uid FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER('$mlist_name'))";
	if(!($result=$db->db_query($sql_query)))
		$error_msg.=$db->db_last_error();
	while($row=$db->db_fetch_object($result))
	{
     	$sql_query="INSERT INTO public.tbl_benutzergruppe(uid, gruppe_kurzbz, insertamum, insertvon) VALUES ('$row->uid','".strtoupper($mlist_name)."', now(), 'mlists_generate')";
		if(!$db->db_query($sql_query))
			$error_msg.=$db->db_last_error().$sql_query;
		echo '-';
		flush();
	}

	// **************************************************************
	// Verteiler fuer alle fixen Lektoren abgleichen
	$mlist_name='tw_fix_lkt';
	setGeneriert($mlist_name);
	// Lektoren holen die nicht mehr in den Verteiler gehoeren
	echo '<BR>'.$mlist_name.' wird abgeglichen!<BR>';
	flush();
	$sql_query="SELECT uid FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER('$mlist_name') AND uid NOT IN (SELECT mitarbeiter_uid FROM public.tbl_mitarbeiter JOIN public.tbl_benutzer ON(uid=mitarbeiter_uid) WHERE aktiv AND fixangestellt AND lektor)";
	if(!($result = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error();
	while($row=$db->db_fetch_object($result))
	{
     	$sql_query="DELETE FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER('$mlist_name') AND uid='$row->uid'";
		if(!$db->db_query($sql_query))
			$error_msg.=$db->db_last_error().$sql_query;
		echo '-';
		flush();
	}
	// Lektoren holen die nicht im Verteiler sind
	echo '<BR>';
	$sql_query="SELECT mitarbeiter_uid AS uid FROM public.tbl_mitarbeiter JOIN public.tbl_benutzer ON(uid=mitarbeiter_uid) WHERE fixangestellt AND lektor AND aktiv AND mitarbeiter_uid NOT LIKE '\\\\_%' AND mitarbeiter_uid NOT IN (SELECT uid FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER('$mlist_name'))";
	if(!($result = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error();
	while($row = $db->db_fetch_object($result))
	{
     	$sql_query="INSERT INTO public.tbl_benutzergruppe(uid, gruppe_kurzbz, insertamum, insertvon) VALUES ('$row->uid','".strtoupper($mlist_name)."', now(), 'mlists_generate')";
		if(!$db->db_query($sql_query))
			$error_msg.=$db->db_last_error().$sql_query;
		echo '-';
		flush();
	}

	// **************************************************************
	// Verteiler fuer alle externen Lektoren abgleichen
	$mlist_name='tw_ext_lkt';
	setGeneriert($mlist_name);
	// Lektoren holen die nicht mehr in den Verteiler gehoeren
	echo '<BR>'.$mlist_name.' wird abgeglichen!<BR>';
	flush();
	$sql_query="SELECT uid FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER('$mlist_name') AND uid NOT IN (SELECT mitarbeiter_uid FROM public.tbl_mitarbeiter JOIN public.tbl_benutzer ON(uid=mitarbeiter_uid) WHERE aktiv AND NOT fixangestellt AND lektor)";
	if(!($result = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error();
	while($row=$db->db_fetch_object($result))
	{
     	$sql_query="DELETE FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER('$mlist_name') AND uid='$row->uid'";
		if(!$db->db_query($sql_query))
			$error_msg.=$db->db_last_error().$sql_query;
		echo '-';
		flush();
	}
	// Lektoren holen die nicht im Verteiler sind
	echo '<BR>';
	$sql_query="SELECT mitarbeiter_uid AS uid FROM public.tbl_mitarbeiter JOIN public.tbl_benutzer ON(uid=mitarbeiter_uid) WHERE NOT fixangestellt AND lektor AND aktiv AND mitarbeiter_uid NOT LIKE '\\\\_%' AND mitarbeiter_uid NOT IN (SELECT uid FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER('$mlist_name'))";
	if(!($result = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error();
	while($row = $db->db_fetch_object($result))
	{
     	$sql_query="INSERT INTO public.tbl_benutzergruppe(uid, gruppe_kurzbz, insertamum, insertvon) VALUES ('$row->uid','".strtoupper($mlist_name)."', now(), 'mlists_generate')";
		if(!$db->db_query($sql_query))
			$error_msg.=$db->db_last_error().$sql_query;
		echo '-';
		flush();
	}


	// **************************************************************
	// Lektoren-Verteiler innerhalb der Studiengaenge abgleichen
	// Lektoren holen die nicht mehr in den Verteiler gehoeren
	echo '<BR>Lektoren-Verteiler der Studiengaenge werden abgeglichen!<BR>';
	flush();
	$sql_query="SELECT uid, gruppe_kurzbz FROM public.tbl_benutzergruppe
		WHERE gruppe_kurzbz LIKE '%\\_LKT' AND UPPER(gruppe_kurzbz)!=UPPER('tw_lkt') AND UPPER(gruppe_kurzbz)!=UPPER('tw_fix_lkt') AND UPPER(gruppe_kurzbz)!=UPPER('tw_ext_lkt') AND UPPER(gruppe_kurzbz)!=UPPER('moodle_lkt')
		AND (uid,UPPER(gruppe_kurzbz)) NOT IN
		(SELECT mitarbeiter_uid,UPPER(typ::varchar(1) || tbl_studiengang.kurzbz || '_lkt')
			FROM lehre.tbl_lehrveranstaltung, lehre.tbl_lehreinheit, lehre.tbl_lehreinheitmitarbeiter, public.tbl_studiengang
			WHERE
			tbl_lehrveranstaltung.lehrveranstaltung_id=tbl_lehreinheit.lehrveranstaltung_id AND
			tbl_lehreinheit.lehreinheit_id=tbl_lehreinheitmitarbeiter.lehreinheit_id AND
			tbl_studiengang.studiengang_kz=tbl_lehrveranstaltung.studiengang_kz AND
			(studiensemester_kurzbz='$studiensemester' OR
			 studiensemester_kurzbz='$stsem2') AND mitarbeiter_uid NOT LIKE '\\\\_%')";
	//echo $sql_query;
	if(!($result=$db->db_query($sql_query)))
		$error_msg.=$db->db_last_error().$sql_query;
	while($row=$db->db_fetch_object($result))
	{
     	$sql_query="DELETE FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER('$row->gruppe_kurzbz') AND uid='$row->uid'";
		if(!$db->db_query($sql_query))
			$error_msg.=$db->db_last_error().$sql_query;
		echo '-';
		flush();
	}
	// Lektoren holen die noch nicht im Verteiler sind
	echo '<BR>';
	$sql_query="SELECT distinct mitarbeiter_uid, UPPER(typ::varchar(1) || tbl_studiengang.kurzbz || '_lkt') AS mlist_name, tbl_studiengang.studiengang_kz
		FROM lehre.tbl_lehrveranstaltung, lehre.tbl_lehreinheit, lehre.tbl_lehreinheitmitarbeiter, public.tbl_studiengang
		WHERE
		tbl_lehrveranstaltung.lehrveranstaltung_id=tbl_lehreinheit.lehrveranstaltung_id AND
		tbl_lehreinheit.lehreinheit_id=tbl_lehreinheitmitarbeiter.lehreinheit_id AND
		tbl_studiengang.studiengang_kz=tbl_lehrveranstaltung.studiengang_kz AND
		(studiensemester_kurzbz='$studiensemester' OR
		 studiensemester_kurzbz='$stsem2') AND
		mitarbeiter_uid NOT LIKE '\\\\_%' AND tbl_studiengang.studiengang_kz!=0 AND
		(mitarbeiter_uid,UPPER(typ::varchar(1) || tbl_studiengang.kurzbz || '_lkt')) NOT IN
		(SELECT uid, UPPER(gruppe_kurzbz) FROM public.tbl_benutzergruppe
			WHERE gruppe_kurzbz LIKE '%\\_LKT' AND UPPER(gruppe_kurzbz)!=UPPER('tw_lkt') AND UPPER(gruppe_kurzbz)!=UPPER('tw_fix_lkt') AND UPPER(gruppe_kurzbz)!=UPPER('tw_ext_lkt') AND UPPER(gruppe_kurzbz)!=UPPER('moodle_lkt'))";
	//echo $sql_query;
	if(!($result=$db->db_query($sql_query)))
		$error_msg.=$db->db_last_error().$sql_query;
	while($row=$db->db_fetch_object($result))
	{
		$sql_query="SELECT * FROM public.tbl_gruppe WHERE gruppe_kurzbz='".strtoupper($row->mlist_name)."'";
		if($res = $db->db_query($sql_query))
		{
			if($db->db_num_rows($res)<=0)
			{
				setGeneriert($row->mlist_name);
				$sql_query="INSERT INTO public.tbl_gruppe(gruppe_kurzbz, studiengang_kz, semester, bezeichnung,
							beschreibung, mailgrp, sichtbar, generiert, aktiv, updateamum, updatevon,
							insertamum, insertvon)
							VALUES('".strtoupper($row->mlist_name)."',$row->studiengang_kz, 0,'$row->mlist_name',".
							"'$row->mlist_name', true, true, true, true, now(),'mlists_generate',now(), 'mlists_generate');";
				if(!$db->db_query($sql_query))
					echo "<br>Fehler beim Anlegen der Gruppe: $sql_query<br>";
			}
		}
		else
			echo "<br>Fehler:$sql_query";

		setGeneriert($row->mlist_name);
     	$sql_query="INSERT INTO public.tbl_benutzergruppe(uid, gruppe_kurzbz, insertamum, insertvon) VALUES ('$row->mitarbeiter_uid','".strtoupper($row->mlist_name)."', now(), 'mlists_generate')";
		if(!$db->db_query($sql_query))
			$error_msg.=$db->db_last_error().$sql_query;
		echo '-';
		flush();
	}

	// **************************************************************
	// Verteiler Hochschulvertretung abgleichen

	echo 'Hochschulvertretungsverteiler werden abgeglichen!<BR>';
	flush();

	//Verteiler anlegen, wenn nicht vorhanden
	$sql_query="SELECT * FROM public.tbl_gruppe WHERE gruppe_kurzbz='TW_HSV'";
	if($res = $db->db_query($sql_query))
	{
		if($db->db_num_rows($res)<=0)
		{
			$sql_query="INSERT INTO public.tbl_gruppe(gruppe_kurzbz, studiengang_kz, semester, bezeichnung,
							beschreibung, mailgrp, sichtbar, generiert, aktiv, updateamum, updatevon,
							insertamum, insertvon)
							VALUES('TW_HSV',0, NULL,'Hochschulvertretung FHTW','Hochschulvertretung FHTW', true, true, true, true, now(),'mlists_generate',now(), 'mlists_generate');";
			if(!$db->db_query($sql_query))
				echo "<br>Fehler beim Anlegen der Gruppe: $sql_query<br>";
		}
	}
	else
		echo "<br>Fehler:$sql_query";

	// Studierende holen, die nicht mehr in den Verteiler gehoeren
	$sql_query="SELECT gruppe_kurzbz, uid
				FROM public.tbl_benutzergruppe JOIN public.tbl_gruppe USING(gruppe_kurzbz)
				WHERE gruppe_kurzbz = 'TW_HSV'
				AND uid not in (SELECT uid FROM public.tbl_benutzerfunktion JOIN public.tbl_benutzer USING(uid)
								WHERE funktion_kurzbz='hsv' AND tbl_benutzer.aktiv AND
								(tbl_benutzerfunktion.datum_von IS NULL OR tbl_benutzerfunktion.datum_von<=now()) AND
								(tbl_benutzerfunktion.datum_bis IS NULL OR tbl_benutzerfunktion.datum_bis>=now())
								AND (SELECT studiengang_kz FROM public.tbl_studiengang
									WHERE oe_kurzbz=tbl_benutzerfunktion.oe_kurzbz LIMIT 1)=tbl_gruppe.studiengang_kz)";
	if(!($result=$db->db_query($sql_query)))
		$error_msg.=$db->db_last_error();
	while($row = $db->db_fetch_object($result))
	{
     	$sql_query="DELETE FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER('$row->gruppe_kurzbz') AND uid='$row->uid'";
		if(!$db->db_query($sql_query))
			$error_msg.=$db->db_last_error().$sql_query;
		echo '-';
		flush();
	}

	// Studierende holen, die nicht im Verteiler sind
	echo '<BR>';
	$sql_query="SELECT uid
				FROM
					public.tbl_benutzerfunktion
					JOIN public.tbl_benutzer USING(uid)
				WHERE
					funktion_kurzbz='hsv'
					AND tbl_benutzer.aktiv AND
					(tbl_benutzerfunktion.datum_von IS NULL OR tbl_benutzerfunktion.datum_von<=now()) AND
					(tbl_benutzerfunktion.datum_bis IS NULL OR tbl_benutzerfunktion.datum_bis>=now())
					AND uid NOT in(SELECT uid from public.tbl_benutzergruppe JOIN public.tbl_gruppe USING(gruppe_kurzbz)
				WHERE studiengang_kz=(SELECT studiengang_kz FROM public.tbl_studiengang
				WHERE oe_kurzbz=tbl_benutzerfunktion.oe_kurzbz LIMIT 1)
					AND gruppe_kurzbz = 'TW_HSV')";
	if(!($result = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error();
	while($row = $db->db_fetch_object($result))
	{
		if($row->uid!='')
		{
			setGeneriert('TW_HSV');
	     	$sql_query="INSERT INTO public.tbl_benutzergruppe (uid, gruppe_kurzbz, insertamum, insertvon) VALUES (".$db->db_add_param($row->uid).",'TW_HSV', now(), 'mlists_generate')";
			if(!$db->db_query($sql_query))
				$error_msg.=$db->db_last_error().$sql_query;
			echo '-';
			flush();
		}
	}

	// **************************************************************
	// StudienvertretungenVerteiler abgleichen

	echo 'Studienvertretungsverteiler werden abgeglichen!<BR>';
	flush();

	//Verteiler anlegen
	$sql_query="SELECT DISTINCT
					UPPER(typ||kurzbz)||'_'||UPPER(funktion_kurzbz) AS gruppe ,
					UPPER(typ||kurzbz) AS studiengang,
					tbl_studiengang.studiengang_kz
				FROM public.tbl_benutzerfunktion
				JOIN public.tbl_studiengang USING (oe_kurzbz)
				WHERE funktion_kurzbz='stdv'
				AND UPPER(typ||kurzbz)||'_'||UPPER(funktion_kurzbz) NOT IN (SELECT gruppe_kurzbz FROM public.tbl_gruppe)
				AND tbl_studiengang.aktiv
				AND tbl_studiengang.studiengang_kz!=0";
	if($res = $db->db_query($sql_query))
	{
		while($row = $db->db_fetch_object($res))
		{
			if($db->db_num_rows($res)>0)
			{
				$sql_query="INSERT INTO public.tbl_gruppe(gruppe_kurzbz, studiengang_kz, semester, bezeichnung,
								beschreibung, mailgrp, sichtbar, generiert, aktiv, updateamum, updatevon,
								insertamum, insertvon)
								VALUES(".$db->db_add_param($row->gruppe).",".$db->db_add_param($row->studiengang_kz).", NULL,".$db->db_add_param('Studienvertretung '.$row->studiengang).",".$db->db_add_param('Studienvertretung '.$row->studiengang).", true, true, true, true, now(),'mlists_generate',now(), 'mlists_generate');";
				if(!$db->db_query($sql_query))
					echo "<br>Fehler beim Anlegen der Gruppe: $sql_query<br>";
			}
		}
	}

	// Studierende holen, die nicht mehr in den Verteiler gehoeren
	$sql_query="SELECT gruppe_kurzbz, uid
				FROM public.tbl_benutzergruppe JOIN public.tbl_gruppe USING(gruppe_kurzbz)
				WHERE gruppe_kurzbz LIKE '%_STDV'
				AND uid not in (SELECT uid FROM public.tbl_benutzerfunktion JOIN public.tbl_benutzer USING(uid)
								WHERE funktion_kurzbz='stdv' AND tbl_benutzer.aktiv AND
								(tbl_benutzerfunktion.datum_von IS NULL OR tbl_benutzerfunktion.datum_von<=now()) AND
								(tbl_benutzerfunktion.datum_bis IS NULL OR tbl_benutzerfunktion.datum_bis>=now())
								AND (SELECT studiengang_kz FROM public.tbl_studiengang
									WHERE oe_kurzbz=tbl_benutzerfunktion.oe_kurzbz LIMIT 1)=tbl_gruppe.studiengang_kz)
								AND tbl_gruppe.studiengang_kz!='0'";
	if(!($result=$db->db_query($sql_query)))
		$error_msg.=$db->db_last_error();
	while($row = $db->db_fetch_object($result))
	{
     	$sql_query="DELETE FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER('$row->gruppe_kurzbz') AND uid='$row->uid'";
		if(!$db->db_query($sql_query))
			$error_msg.=$db->db_last_error().$sql_query;
		echo '-';
		flush();
	}
	ob_flush();
	// Studierende holen, die nicht im Verteiler sind
	echo '<BR>';
	$sql_query="SELECT uid, tbl_gruppe.gruppe_kurzbz
				FROM
					public.tbl_benutzerfunktion
					JOIN public.tbl_benutzer USING(uid)
					JOIN public.tbl_studiengang USING(oe_kurzbz)
					JOIN public.tbl_gruppe ON(tbl_gruppe.studiengang_kz=tbl_studiengang.studiengang_kz AND gruppe_kurzbz like '%_STDV')
				WHERE
					funktion_kurzbz='stdv'
					AND tbl_benutzer.aktiv AND
					(tbl_benutzerfunktion.datum_von IS NULL OR tbl_benutzerfunktion.datum_von<=now()) AND
					(tbl_benutzerfunktion.datum_bis IS NULL OR tbl_benutzerfunktion.datum_bis>=now())
					AND uid NOT in(Select uid from public.tbl_benutzergruppe JOIN public.tbl_gruppe USING(gruppe_kurzbz)
				WHERE studiengang_kz=(SELECT studiengang_kz FROM public.tbl_studiengang
				WHERE oe_kurzbz=tbl_benutzerfunktion.oe_kurzbz LIMIT 1)
					AND gruppe_kurzbz Like '%_STDV')";
	if(!($result = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error();
	while($row = $db->db_fetch_object($result))
	{
		if($row->gruppe_kurzbz!='')
		{
			setGeneriert($row->gruppe_kurzbz);
	     	$sql_query="INSERT INTO public.tbl_benutzergruppe (uid, gruppe_kurzbz, insertamum, insertvon) VALUES ('$row->uid','".mb_strtoupper($row->gruppe_kurzbz)."', now(), 'mlists_generate')";
			if(!$db->db_query($sql_query))
				$error_msg.=$db->db_last_error().$sql_query;
			echo '-';
			flush();
		}
	}

	//TW_STDV abgleichen

	//Verteiler TW_STDV anlegen, wenn nicht vorhanden
	$sql_query="SELECT * FROM public.tbl_gruppe WHERE gruppe_kurzbz='TW_STDV'";
	if($res = $db->db_query($sql_query))
	{
		if($db->db_num_rows($res)<=0)
		{
			$sql_query="INSERT INTO public.tbl_gruppe(gruppe_kurzbz, studiengang_kz, semester, bezeichnung,
							beschreibung, mailgrp, sichtbar, generiert, aktiv, updateamum, updatevon,
							insertamum, insertvon)
							VALUES('TW_STDV',0, NULL,'Alle StudienvertreterInnen','Alle StudienvertreterInnen', true, true, true, true, now(),'mlists_generate',now(), 'mlists_generate');";
			if(!$db->db_query($sql_query))
				echo "<br>Fehler beim Anlegen der Gruppe: $sql_query<br>";
		}
	}
	else
		echo "<br>Fehler:$sql_query";

    flush();
	ob_flush();
    setGeneriert('TW_STDV');
	$sql_query="SELECT gruppe_kurzbz, uid FROM public.tbl_benutzergruppe
				WHERE gruppe_kurzbz='TW_STDV'
				AND uid not in (SELECT uid FROM public.tbl_benutzerfunktion JOIN public.tbl_benutzer USING(uid)
								WHERE funktion_kurzbz='stdv' AND tbl_benutzer.aktiv AND
								(tbl_benutzerfunktion.datum_von IS NULL OR tbl_benutzerfunktion.datum_von<=now()) AND
								(tbl_benutzerfunktion.datum_bis IS NULL OR tbl_benutzerfunktion.datum_bis>=now())
								)";
	if(!($result = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error();
	while($row = $db->db_fetch_object($result))
	{
     	$sql_query="DELETE FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER('tw_stdv') AND uid='$row->uid'";
		if(!$db->db_query($sql_query))
			$error_msg.=$db->db_last_error().$sql_query;
		echo '-';
		flush();
	}

	// Studierende holen, die nicht im Verteiler sind und einfuegen
	echo '<BR>';
	$sql_query="SELECT uid FROM public.tbl_benutzerfunktion JOIN public.tbl_benutzer USING(uid)
				WHERE funktion_kurzbz='stdv' AND tbl_benutzer.aktiv AND
				(tbl_benutzerfunktion.datum_von IS NULL OR tbl_benutzerfunktion.datum_von<=now()) AND
				(tbl_benutzerfunktion.datum_bis IS NULL OR tbl_benutzerfunktion.datum_bis>=now())
				AND uid NOT in(Select uid from public.tbl_benutzergruppe
								WHERE UPPER(gruppe_kurzbz)= UPPER('TW_STDV'))";
	if(!($result = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error();
	while($row = $db->db_fetch_object($result))
	{
	   	$sql_query="INSERT INTO public.tbl_benutzergruppe (uid, gruppe_kurzbz, insertamum, insertvon) VALUES ('$row->uid','TW_STDV', now(), 'mlists_generate')";
		if(!$db->db_query($sql_query))
			$error_msg.=$db->db_last_error().$sql_query;
		echo '-';
		flush();
	}

	// **************************************************************
	// Verteiler Jahrgangsvertretung abgleichen

	echo 'Jahrgangsvertretungsverteiler werden abgeglichen!<BR>';
	flush();

	//Verteiler der einzelnen Studiengaenge anlegen
	$sql_query="SELECT DISTINCT
					UPPER(typ||kurzbz)||'_'||UPPER(funktion_kurzbz) AS gruppe ,
					UPPER(typ||kurzbz) AS studiengang,
					tbl_studiengang.studiengang_kz
				FROM public.tbl_benutzerfunktion
				JOIN public.tbl_studiengang USING (oe_kurzbz)
				WHERE funktion_kurzbz='jgv'
				AND UPPER(typ||kurzbz)||'_'||UPPER(funktion_kurzbz) NOT IN (SELECT gruppe_kurzbz FROM public.tbl_gruppe)
				AND tbl_studiengang.aktiv
				AND tbl_studiengang.studiengang_kz!=0";
	if($res = $db->db_query($sql_query))
	{
		while($row = $db->db_fetch_object($res))
		{
			if($db->db_num_rows($res)>0)
			{
				$sql_query="INSERT INTO public.tbl_gruppe(gruppe_kurzbz, studiengang_kz, semester, bezeichnung,
								beschreibung, mailgrp, sichtbar, generiert, aktiv, updateamum, updatevon,
								insertamum, insertvon)
								VALUES(".$db->db_add_param($row->gruppe).",".$db->db_add_param($row->studiengang_kz).", NULL,".$db->db_add_param('Jahrgangsvertretung '.$row->studiengang).",".$db->db_add_param('Jahrgangsvertretung '.$row->studiengang).", true, true, true, true, now(),'mlists_generate',now(), 'mlists_generate');";
				if(!$db->db_query($sql_query))
					echo "<br>Fehler beim Anlegen der Gruppe: $sql_query<br>";
			}
		}
	}

	// Studierende holen, die nicht mehr in den Verteiler gehoeren
	$sql_query="SELECT gruppe_kurzbz, uid
				FROM public.tbl_benutzergruppe JOIN public.tbl_gruppe USING(gruppe_kurzbz)
				WHERE gruppe_kurzbz LIKE '%_JGV'
				AND uid not in (SELECT uid FROM public.tbl_benutzerfunktion JOIN public.tbl_benutzer USING(uid)
								WHERE funktion_kurzbz='jgv' AND tbl_benutzer.aktiv AND
								(tbl_benutzerfunktion.datum_von IS NULL OR tbl_benutzerfunktion.datum_von<=now()) AND
								(tbl_benutzerfunktion.datum_bis IS NULL OR tbl_benutzerfunktion.datum_bis>=now())
								AND (SELECT studiengang_kz FROM public.tbl_studiengang
									WHERE oe_kurzbz=tbl_benutzerfunktion.oe_kurzbz LIMIT 1)=tbl_gruppe.studiengang_kz)
								AND tbl_gruppe.studiengang_kz!='0'";
	if(!($result=$db->db_query($sql_query)))
		$error_msg.=$db->db_last_error();
	while($row = $db->db_fetch_object($result))
	{
     	$sql_query="DELETE FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER('$row->gruppe_kurzbz') AND uid='$row->uid'";
		if(!$db->db_query($sql_query))
			$error_msg.=$db->db_last_error().$sql_query;
		echo '-';
		flush();
	}

	// Studierende holen, die noch nicht im Verteiler sind
	echo '<BR>';
	$sql_query="SELECT uid, tbl_gruppe.gruppe_kurzbz
				FROM
					public.tbl_benutzerfunktion
					JOIN public.tbl_benutzer USING(uid)
					JOIN public.tbl_studiengang USING(oe_kurzbz)
					JOIN public.tbl_gruppe ON(tbl_gruppe.studiengang_kz=tbl_studiengang.studiengang_kz AND gruppe_kurzbz like '%_JGV')
				WHERE
					funktion_kurzbz='jgv'
					AND tbl_benutzer.aktiv AND
					(tbl_benutzerfunktion.datum_von IS NULL OR tbl_benutzerfunktion.datum_von<=now()) AND
					(tbl_benutzerfunktion.datum_bis IS NULL OR tbl_benutzerfunktion.datum_bis>=now())
					AND uid NOT in(Select uid from public.tbl_benutzergruppe JOIN public.tbl_gruppe USING(gruppe_kurzbz)
				WHERE studiengang_kz=(SELECT studiengang_kz FROM public.tbl_studiengang
				WHERE oe_kurzbz=tbl_benutzerfunktion.oe_kurzbz LIMIT 1)
					AND gruppe_kurzbz Like '%_JGV')";
	if(!($result = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error();
	while($row = $db->db_fetch_object($result))
	{
		if($row->gruppe_kurzbz!='')
		{
			setGeneriert($row->gruppe_kurzbz);
	     	$sql_query="INSERT INTO public.tbl_benutzergruppe (uid, gruppe_kurzbz, insertamum, insertvon) VALUES ('$row->uid','".mb_strtoupper($row->gruppe_kurzbz)."', now(), 'mlists_generate')";
			if(!$db->db_query($sql_query))
				$error_msg.=$db->db_last_error().$sql_query;
			echo '-';
			flush();
		}
	}

	//TW_JGV abgleichen

	//Verteiler TW_JGV anlegen, wenn nicht vorhanden
	$sql_query="SELECT * FROM public.tbl_gruppe WHERE gruppe_kurzbz='TW_JGV'";
	if($res = $db->db_query($sql_query))
	{
		if($db->db_num_rows($res)<=0)
		{
			$sql_query="INSERT INTO public.tbl_gruppe(gruppe_kurzbz, studiengang_kz, semester, bezeichnung,
							beschreibung, mailgrp, sichtbar, generiert, aktiv, updateamum, updatevon,
							insertamum, insertvon)
							VALUES('TW_JGV',0, NULL,'Alle JahrgangsvertreterInnen','Alle JahrgangsvertreterInnen', true, true, true, true, now(),'mlists_generate',now(), 'mlists_generate');";
			if(!$db->db_query($sql_query))
				echo "<br>Fehler beim Anlegen der Gruppe: $sql_query<br>";
		}
	}
	else
		echo "<br>Fehler:$sql_query";
	// Studierende holen, die nicht mehr in den Verteiler gehoeren
    flush();
	ob_flush();
    setGeneriert('TW_JGV');
	$sql_query="SELECT gruppe_kurzbz, uid FROM public.tbl_benutzergruppe
				WHERE gruppe_kurzbz='TW_JGV'
				AND uid not in (SELECT uid FROM public.tbl_benutzerfunktion JOIN public.tbl_benutzer USING(uid)
								WHERE funktion_kurzbz='jgv' AND tbl_benutzer.aktiv AND
								(tbl_benutzerfunktion.datum_von IS NULL OR tbl_benutzerfunktion.datum_von<=now()) AND
								(tbl_benutzerfunktion.datum_bis IS NULL OR tbl_benutzerfunktion.datum_bis>=now())
								)";
	if(!($result = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error();
	while($row = $db->db_fetch_object($result))
	{
     	$sql_query="DELETE FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER('tw_jgv') AND uid='$row->uid'";
		if(!$db->db_query($sql_query))
			$error_msg.=$db->db_last_error().$sql_query;
		echo '-';
		flush();
	}

	// Studierende holen, die noch nicht im Verteiler sind
	echo '<BR>';
	$sql_query="SELECT uid FROM public.tbl_benutzerfunktion JOIN public.tbl_benutzer USING(uid)
				WHERE funktion_kurzbz='jgv' AND tbl_benutzer.aktiv AND
				(tbl_benutzerfunktion.datum_von IS NULL OR tbl_benutzerfunktion.datum_von<=now()) AND
				(tbl_benutzerfunktion.datum_bis IS NULL OR tbl_benutzerfunktion.datum_bis>=now())
				AND uid NOT in(Select uid from public.tbl_benutzergruppe
								WHERE UPPER(gruppe_kurzbz)= UPPER('TW_JGV'))";
	if(!($result = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error();
	while($row = $db->db_fetch_object($result))
	{
	   	$sql_query="INSERT INTO public.tbl_benutzergruppe (uid, gruppe_kurzbz, insertamum, insertvon) VALUES ('$row->uid','TW_JGV', now(), 'mlists_generate')";
		if(!$db->db_query($sql_query))
			$error_msg.=$db->db_last_error().$sql_query;
		echo '-';
		flush();
	}

	// ***************************
	// TW_STD abgleichen
    flush();
    setGeneriert('TW_STD');
    echo 'TW_STD wird abgeglichen!<br>';

    //Abbrecher bleiben noch 3 Wochen im Verteiler
    //andere inaktive noch fuer 20 Wochen
    //damit im CIS die Menuepunkte fuer Studierende richtig angezeigt werden
	$sql_query="DELETE FROM public.tbl_benutzergruppe
				WHERE UPPER(gruppe_kurzbz)='TW_STD'
				AND uid not in
					(SELECT uid FROM campus.vw_student WHERE aktiv
					UNION
					SELECT uid FROM campus.vw_student WHERE aktiv=false AND get_rolle_prestudent(vw_student.prestudent_id, null)='Abbrecher' AND updateaktivam>now()-'3 weeks'::interval
					UNION
					SELECT uid FROM campus.vw_student WHERE aktiv=false AND get_rolle_prestudent(vw_student.prestudent_id, null)!='Abbrecher' AND updateaktivam>now()-'20 weeks'::interval
				)";
	if($result = $db->db_query($sql_query))
	{
		echo $db->db_affected_rows($result).' Eintraege entfernt<br>';
	}
	else
	{
		$error_msg.=$db->db_last_error();
	}

	// Studenten holen die nicht im Verteiler sind
	$sql_query="INSERT INTO public.tbl_benutzergruppe (uid, gruppe_kurzbz, insertamum, insertvon)
				SELECT uid,'TW_STD',now(),'mlists_generate'
				FROM campus.vw_student
				WHERE (aktiv
						OR
						(aktiv=false AND get_rolle_prestudent(vw_student.prestudent_id, null)='Abbrecher' AND updateaktivam>now()-'3 weeks'::interval)
						OR
						(aktiv=false AND get_rolle_prestudent(vw_student.prestudent_id, null)!='Abbrecher' AND updateaktivam>now()-'20 weeks'::interval))
				AND uid NOT in(SELECT uid FROM public.tbl_benutzergruppe
								WHERE UPPER(gruppe_kurzbz)='TW_STD')";
	if($result = $db->db_query($sql_query))
	{
		echo $db->db_affected_rows($result).' Eintraege hinzugefuegt<br>';
	}
	else
		$error_msg.=$db->db_last_error();


	// ***************************
	// TW_STD_M abgleichen. Alle maennlichen Studenten
    flush();
	ob_flush();
    setGeneriert('TW_STD_M');
    echo 'TW_STD_M wird abgeglichen!<br>';

    //Abbrecher bleiben noch 3 Wochen im Verteiler
    //andere inaktive noch fuer 20 Wochen
    //damit im CIS die Menuepunkte fuer Studierende richtig angezeigt werden
	$sql_query="DELETE FROM public.tbl_benutzergruppe
				WHERE UPPER(gruppe_kurzbz)='TW_STD_M'
				AND uid not in
					(SELECT uid FROM campus.vw_student WHERE aktiv AND geschlecht='m'
					UNION
					SELECT uid FROM campus.vw_student WHERE aktiv=false AND geschlecht='m' AND get_rolle_prestudent(vw_student.prestudent_id, null)='Abbrecher' AND updateaktivam>now()-'3 weeks'::interval
					UNION
					SELECT uid FROM campus.vw_student WHERE aktiv=false AND geschlecht='m' AND get_rolle_prestudent(vw_student.prestudent_id, null)!='Abbrecher' AND updateaktivam>now()-'20 weeks'::interval
				)";
	if($result = $db->db_query($sql_query))
	{
		echo $db->db_affected_rows($result).' Eintraege entfernt<br>';
	}
	else
	{
		$error_msg.=$db->db_last_error();
	}

	// Studenten holen die nicht im Verteiler sind
	$sql_query="INSERT INTO public.tbl_benutzergruppe (uid, gruppe_kurzbz, insertamum, insertvon)
				SELECT uid,'TW_STD_M',now(),'mlists_generate'
				FROM campus.vw_student
				WHERE (aktiv AND geschlecht='m'
						OR
						(aktiv=false AND geschlecht='m' AND get_rolle_prestudent(vw_student.prestudent_id, null)='Abbrecher' AND updateaktivam>now()-'3 weeks'::interval)
						OR
						(aktiv=false AND geschlecht='m' AND get_rolle_prestudent(vw_student.prestudent_id, null)!='Abbrecher' AND updateaktivam>now()-'20 weeks'::interval))
				AND uid NOT in(SELECT uid FROM public.tbl_benutzergruppe
								WHERE UPPER(gruppe_kurzbz)='TW_STD_M')";
	if($result = $db->db_query($sql_query))
	{
		echo $db->db_affected_rows($result).' Eintraege hinzugefuegt<br>';
	}
	else
		$error_msg.=$db->db_last_error();


	// ***************************
	// TW_STD_W abgleichen. Alle weiblichen Studentinnen
    flush();
	ob_flush();
    setGeneriert('TW_STD_W');
    echo 'TW_STD_W wird abgeglichen!<br>';

    //Abbrecher bleiben noch 3 Wochen im Verteiler
    //andere inaktive noch fuer 20 Wochen
    //damit im CIS die Menuepunkte fuer Studierende richtig angezeigt werden
	$sql_query="DELETE FROM public.tbl_benutzergruppe
				WHERE UPPER(gruppe_kurzbz)='TW_STD_W'
				AND uid not in
					(SELECT uid FROM campus.vw_student WHERE aktiv AND geschlecht='w'
					UNION
					SELECT uid FROM campus.vw_student WHERE aktiv=false AND geschlecht='w' AND get_rolle_prestudent(vw_student.prestudent_id, null)='Abbrecher' AND updateaktivam>now()-'3 weeks'::interval
					UNION
					SELECT uid FROM campus.vw_student WHERE aktiv=false AND geschlecht='w' AND get_rolle_prestudent(vw_student.prestudent_id, null)!='Abbrecher' AND updateaktivam>now()-'20 weeks'::interval
				)";
	if($result = $db->db_query($sql_query))
	{
		echo $db->db_affected_rows($result).' Eintraege entfernt<br>';
	}
	else
	{
		$error_msg.=$db->db_last_error();
	}

	// Studenten holen die nicht im Verteiler sind
	$sql_query="INSERT INTO public.tbl_benutzergruppe (uid, gruppe_kurzbz, insertamum, insertvon)
				SELECT uid,'TW_STD_W',now(),'mlists_generate'
				FROM campus.vw_student
				WHERE (aktiv AND geschlecht='w'
						OR
						(aktiv=false AND geschlecht='w' AND get_rolle_prestudent(vw_student.prestudent_id, null)='Abbrecher' AND updateaktivam>now()-'3 weeks'::interval)
						OR
						(aktiv=false AND geschlecht='w' AND get_rolle_prestudent(vw_student.prestudent_id, null)!='Abbrecher' AND updateaktivam>now()-'20 weeks'::interval))
				AND uid NOT in(SELECT uid FROM public.tbl_benutzergruppe
								WHERE UPPER(gruppe_kurzbz)='TW_STD_W')";
	if($result = $db->db_query($sql_query))
	{
		echo $db->db_affected_rows($result).' Eintraege hinzugefuegt<br>';
	}
	else
		$error_msg.=$db->db_last_error();


   	// **************************************************************
	// Moodle - LektorenVerteiler abgleichen
	$mlist_name='moodle_lkt';
	setGeneriert($mlist_name);
	// Lektoren holen die nicht mehr in den Verteiler gehoeren
	echo $mlist_name.' wird abgeglichen!<BR>';
	flush();
	ob_flush();

	$sql_query = "SELECT distinct mitarbeiter_uid uid
				from lehre.tbl_lehrveranstaltung, lehre.tbl_lehreinheit, lehre.tbl_moodle ,campus.vw_lehreinheit
				where tbl_lehrveranstaltung.lehrveranstaltung_id=tbl_lehreinheit.lehrveranstaltung_id
				and  vw_lehreinheit.studiengang_kz=tbl_lehrveranstaltung.studiengang_kz
				and vw_lehreinheit.lehrveranstaltung_id=tbl_lehreinheit.lehrveranstaltung_id
				and vw_lehreinheit.lehreinheit_id=tbl_lehreinheit.lehreinheit_id
				and vw_lehreinheit.studiensemester_kurzbz=tbl_lehreinheit.studiensemester_kurzbz
				and vw_lehreinheit.studiensemester_kurzbz=tbl_lehreinheit.studiensemester_kurzbz
				and ((tbl_lehrveranstaltung.lehrveranstaltung_id=tbl_moodle.lehrveranstaltung_id
				and tbl_moodle.studiensemester_kurzbz=tbl_lehreinheit.studiensemester_kurzbz)
				OR 	(tbl_lehreinheit.lehreinheit_id=tbl_moodle.lehreinheit_id))
			 ";
   	$sql_querys="DELETE FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER('$mlist_name') AND uid NOT IN ($sql_query)";
	if(!$result = $db->db_query($sql_querys))
	{
		$error_msg.=$db->db_last_error().' '.$sql_querys;
	}

	$sql_query.=" AND NOT EXISTS(SELECT 1 FROM public.tbl_benutzergruppe WHERE gruppe_kurzbz=UPPER(".$db->db_add_param($mlist_name).") AND uid=vw_lehreinheit.mitarbeiter_uid)";
	if(!($result = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error().' '.$sql_query;
	// Lektoren holen die nicht im Verteiler sind
	echo '<BR>';
	while($row = $db->db_fetch_object($result))
	{
     	$sql_query="INSERT INTO public.tbl_benutzergruppe(uid, gruppe_kurzbz, insertamum, insertvon) VALUES ('$row->uid','".strtoupper($mlist_name)."', now(), 'mlists_generate')";
		if(!$db->db_query($sql_query))
		{
			$error_msg.=$db->db_last_error().$sql_query;
			exit($error_msg);
		}
		echo '-';
		flush();
	}

	// **************************************************************
	// Organisationseinheiten-Verteiler

	/*
	$qry = "SELECT * FROM public.tbl_organisationseinheit WHERE aktiv AND mailverteiler";
	if($result = $db->db_query($qry))
	{
		while($row = $db->db_fetch_object($result))
		{
			$mlist_name=strtoupper($row->oe_kurzbz);

			$grp = new gruppe();
			if(!$grp->exists($mlist_name))
			{
				$grp->gruppe_kurzbz = $mlist_name;
				$grp->studiengang_kz = '0';
				$grp->bezeichnung = $row->oe_kurzbz;
				$grp->beschreibung = 'Personen der Organisationseinheit '.$row->bezeichnung;
				$grp->semester = '0';
				$grp->mailgrp = true;
				$grp->sichtbar = true;
				$grp->generiert = true;
				$grp->aktiv = true;
				$grp->lehre = true;
				$grp->insertamum = date('Y-m-d H:i:s');
				$grp->insertvon = 'mlists_generate';

				if(!$grp->save(true, false))
					die('Fehler: '.$grp->errormsg);
			}
			else
			{
				setGeneriert($mlist_name);
			}

			$oe = new organisationseinheit();
			$childs = $oe->getChilds($row->oe_kurzbz);

			// Lektoren holen die nicht mehr in den Verteiler gehoeren
			echo '<br>'.$mlist_name.' wird abgeglichen!<BR>';
			flush();

			$oes='';
			foreach ($childs as $oe_kurzbz)
			{
				if($oes!='')
					$oes.=',';

				$oes .= "'".addslashes($oe_kurzbz)."'";
			}

			$sql_query = "SELECT distinct uid FROM public.tbl_benutzer JOIN public.tbl_benutzerfunktion USING(uid)
						WHERE oe_kurzbz in($oes)
						AND tbl_benutzer.aktiv
						AND (tbl_benutzerfunktion.datum_von<=now() OR tbl_benutzerfunktion.datum_von is null)
						AND (tbl_benutzerfunktion.datum_bis>=now() OR tbl_benutzerfunktion.datum_bis is null)";

			$sql_querys="DELETE FROM public.tbl_benutzergruppe WHERE gruppe_kurzbz='$mlist_name' AND uid NOT IN ($sql_query)";
			if(!$db->db_query($sql_querys))
			{
				$error_msg.=$db->db_last_error().' '.$sql_querys;
				echo '-';
				flush();
			}

			$sql_query.=" AND uid NOT IN (SELECT uid FROM public.tbl_benutzergruppe WHERE gruppe_kurzbz='$mlist_name')";
			if(!($result_oe = $db->db_query($sql_query)))
				$error_msg.=$db->db_last_error().' '.$sql_query;
			// Lektoren holen die nicht im Verteiler sind
			echo '<BR>';
			while($row_oe = $db->db_fetch_object($result_oe))
			{
		     	$sql_query="INSERT INTO public.tbl_benutzergruppe(uid, gruppe_kurzbz, insertamum, insertvon) VALUES ('$row_oe->uid','".$mlist_name."', now(), 'mlists_generate')";
				if(!$db->db_query($sql_query))
				{
					$error_msg.=$db->db_last_error().$sql_query;
					exit($error_msg);
				}
				echo '-';
				flush();
			}
		}
	}
	*/
	// **************************************************************
	// Instituts-Verteiler
	echo '<br>Abgleich der Institutsverteiler<br>';
	//Externe Mitarbeiter
	$qry = "SELECT * FROM public.tbl_organisationseinheit WHERE aktiv AND mailverteiler AND organisationseinheittyp_kurzbz='Institut'";

	if($result = $db->db_query($qry))
	{
		while($row = $db->db_fetch_object($result))
		{
			$mlist_name=strtoupper($row->oe_kurzbz).'_EXT';

			$grp = new gruppe();
			if(!$grp->exists($mlist_name))
			{
				$grp->gruppe_kurzbz = $mlist_name;
				$grp->studiengang_kz = '0';
				$grp->bezeichnung = $row->oe_kurzbz;
				$grp->beschreibung = 'Externe Mitarbeiter des Instituts '.$row->bezeichnung;
				$grp->semester = '0';
				$grp->mailgrp = true;
				$grp->sichtbar = true;
				$grp->generiert = true;
				$grp->aktiv = true;
				$grp->lehre = true;
				$grp->insertamum = date('Y-m-d H:i:s');
				$grp->insertvon = 'mlists_generate';

				if(!$grp->save(true, false))
					die('Fehler: '.$grp->errormsg);
			}
			else
			{
				setGeneriert($mlist_name);
			}

			$oe = new organisationseinheit();
			$childs = $oe->getChilds($row->oe_kurzbz);

			// Lektoren holen die nicht mehr in den Verteiler gehoeren
			echo '<br>'.$mlist_name.' wird abgeglichen!';
			flush();

			$oes='';
			foreach ($childs as $oe_kurzbz)
			{
				if($oes!='')
					$oes.=',';

				$oes .= "'".addslashes($oe_kurzbz)."'";
			}

			$sql_query = "SELECT distinct uid
						FROM
							public.tbl_benutzer
							JOIN public.tbl_benutzerfunktion USING(uid)
							JOIN public.tbl_mitarbeiter ON(uid=mitarbeiter_uid)
						WHERE oe_kurzbz in($oes)
						AND tbl_benutzer.aktiv AND NOT fixangestellt
						AND (tbl_benutzerfunktion.datum_von<=now() OR tbl_benutzerfunktion.datum_von is null)
						AND (tbl_benutzerfunktion.datum_bis>=now() OR tbl_benutzerfunktion.datum_bis is null)";

			$sql_querys="DELETE FROM public.tbl_benutzergruppe WHERE gruppe_kurzbz='$mlist_name' AND uid NOT IN ($sql_query)";
			if(!$db->db_query($sql_querys))
			{
				$error_msg.=$db->db_last_error().' '.$sql_querys;
			}

			$sql_query.=" AND uid NOT IN (SELECT uid FROM public.tbl_benutzergruppe WHERE gruppe_kurzbz='$mlist_name')";
			if(!($result_oe = $db->db_query($sql_query)))
				$error_msg.=$db->db_last_error().' '.$sql_query;
			// Lektoren holen die nicht im Verteiler sind

			while($row_oe = $db->db_fetch_object($result_oe))
			{
		     	$sql_query="INSERT INTO public.tbl_benutzergruppe(uid, gruppe_kurzbz, insertamum, insertvon) VALUES ('$row_oe->uid','".$mlist_name."', now(), 'mlists_generate')";
				if(!$db->db_query($sql_query))
				{
					$error_msg.=$db->db_last_error().$sql_query;
				}
			}
		}
	}

	//Fixe Mitarbeiter
	$qry = "SELECT * FROM public.tbl_organisationseinheit WHERE aktiv AND mailverteiler AND organisationseinheittyp_kurzbz='Institut'";

	if($result = $db->db_query($qry))
	{
		while($row = $db->db_fetch_object($result))
		{
			$mlist_name=strtoupper($row->oe_kurzbz).'_FIX';

			$grp = new gruppe();
			if(!$grp->exists($mlist_name))
			{
				$grp->gruppe_kurzbz = $mlist_name;
				$grp->studiengang_kz = '0';
				$grp->bezeichnung = $row->oe_kurzbz;
				$grp->beschreibung = 'Fixangestellte Mitarbeiter des Instituts '.$row->bezeichnung;
				$grp->semester = '0';
				$grp->mailgrp = true;
				$grp->sichtbar = true;
				$grp->generiert = true;
				$grp->aktiv = true;
				$grp->lehre = true;
				$grp->insertamum = date('Y-m-d H:i:s');
				$grp->insertvon = 'mlists_generate';

				if(!$grp->save(true, false))
					die('Fehler: '.$grp->errormsg);
			}
			else
			{
				setGeneriert($mlist_name);
			}

			$oe = new organisationseinheit();
			$childs = $oe->getChilds($row->oe_kurzbz);

			// Lektoren holen die nicht mehr in den Verteiler gehoeren
			echo '<br>'.$mlist_name.' wird abgeglichen!';
			flush();

			$oes='';
			foreach ($childs as $oe_kurzbz)
			{
				if($oes!='')
					$oes.=',';

				$oes .= "'".addslashes($oe_kurzbz)."'";
			}

			$sql_query = "SELECT distinct uid
						FROM
							public.tbl_benutzer
							JOIN public.tbl_benutzerfunktion USING(uid)
							JOIN public.tbl_mitarbeiter ON(uid=mitarbeiter_uid)
						WHERE oe_kurzbz in($oes)
						AND tbl_benutzer.aktiv AND fixangestellt
						AND (tbl_benutzerfunktion.datum_von<=now() OR tbl_benutzerfunktion.datum_von is null)
						AND (tbl_benutzerfunktion.datum_bis>=now() OR tbl_benutzerfunktion.datum_bis is null)";

			$sql_querys="DELETE FROM public.tbl_benutzergruppe WHERE gruppe_kurzbz='$mlist_name' AND uid NOT IN ($sql_query)";
			if(!$db->db_query($sql_querys))
			{
				$error_msg.=$db->db_last_error().' '.$sql_querys;
			}

			$sql_query.=" AND uid NOT IN (SELECT uid FROM public.tbl_benutzergruppe WHERE gruppe_kurzbz='$mlist_name')";
			if(!($result_oe = $db->db_query($sql_query)))
				$error_msg.=$db->db_last_error().' '.$sql_query;
			// Lektoren holen die nicht im Verteiler sind
			while($row_oe = $db->db_fetch_object($result_oe))
			{
		     	$sql_query="INSERT INTO public.tbl_benutzergruppe(uid, gruppe_kurzbz, insertamum, insertvon) VALUES ('$row_oe->uid','".$mlist_name."', now(), 'mlists_generate')";
				if(!$db->db_query($sql_query))
				{
					$error_msg.=$db->db_last_error().$sql_query;
				}
			}
		}
	}
	echo '<br>';
	// **************************************************************
	// Studentenverteiler fuer die einzelnen Organisationseinheiten bei Mischformen
	echo '<br>Abgleich der Mischformverteiler';
	$stsem = $stsem_obj->getNearest();

	$sql_query = "
		SELECT
			tbl_prestudentstatus.orgform_kurzbz,
			tbl_studiengang.studiengang_kz,
			tbl_studiengang.typ,
			tbl_studiengang.kurzbz
		FROM
			public.tbl_student
			JOIN public.tbl_benutzer ON(student_uid=uid)
			JOIN public.tbl_prestudentstatus USING(prestudent_id)
			JOIN public.tbl_studiengang USING(studiengang_kz)
		WHERE
			tbl_studiengang.mischform
			AND tbl_benutzer.aktiv
			AND tbl_prestudentstatus.orgform_kurzbz is not null
		GROUP BY
			tbl_studiengang.studiengang_kz, tbl_prestudentstatus.orgform_kurzbz, tbl_studiengang.typ, tbl_studiengang.kurzbz
		";

	if($result = $db->db_query($sql_query))
	{
		echo '<BR>';

		while($row = $db->db_fetch_object($result))
		{
	     	$mlist_name=strtoupper($row->typ.$row->kurzbz.'_'.$row->orgform_kurzbz);
	     	echo $mlist_name.'<br>';

	     	//Gruppe anlegen falls noch nicht vorhanden
			$grp = new gruppe();
			if(!$grp->exists($mlist_name))
			{
				$grp->gruppe_kurzbz = $mlist_name;
				$grp->studiengang_kz = $row->studiengang_kz;
				$grp->bezeichnung = 'Alle '.$row->orgform_kurzbz.' Studenten von '.strtoupper($row->typ.$row->kurzbz);
				$grp->beschreibung = 'Alle '.$row->orgform_kurzbz.' Studenten von '.strtoupper($row->typ.$row->kurzbz);
				$grp->semester = '0';
				$grp->mailgrp = true;
				$grp->sichtbar = true;
				$grp->generiert = true;
				$grp->aktiv = true;
				$grp->lehre = false;
				$grp->insertamum = date('Y-m-d H:i:s');
				$grp->insertvon = 'mlists_generate';

				if(!$grp->save(true, false))
					die('Fehler: '.$grp->errormsg);
			}
			else
			{
				setGeneriert($mlist_name);
			}

			$sql_query="
				SELECT
					distinct student_uid
				FROM
					public.tbl_student
					JOIN public.tbl_benutzer ON(uid=student_uid)
				WHERE
					tbl_benutzer.aktiv AND
					'".addslashes($row->orgform_kurzbz)."'=
						(SELECT orgform_kurzbz
						 FROM public.tbl_prestudentstatus
						 WHERE
						 	prestudent_id=tbl_student.prestudent_id
						 	AND tbl_prestudentstatus.studiensemester_kurzbz='".addslashes($stsem)."'
						 ORDER BY datum desc, insertamum desc, ext_id desc LIMIT 1)
					AND tbl_student.studiengang_kz='".addslashes($row->studiengang_kz)."'";

			//Personen entfernen die nicht mehr in den Verteiler gehoeren
			$qry = "DELETE FROM public.tbl_benutzergruppe WHERE gruppe_kurzbz='".$mlist_name."' AND uid NOT IN(".$sql_query.");";
			if(!$db->db_query($qry))
			{
				$error_msg.="Fehler bei Qry:".$qry;
			}

			//Fehlende Personen hinzufuegen
			$sql_query.=" AND student_uid NOT IN (SELECT uid FROM public.tbl_benutzergruppe WHERE gruppe_kurzbz='$mlist_name')";
			if(!($result_oe = $db->db_query($sql_query)))
				$error_msg.=$db->db_last_error().' '.$sql_query;


			while($row_oe = $db->db_fetch_object($result_oe))
			{
		     	$sql_query="INSERT INTO public.tbl_benutzergruppe(uid, gruppe_kurzbz, insertamum, insertvon) VALUES ('$row_oe->student_uid','".$mlist_name."', now(), 'mlists_generate')";
				if(!$db->db_query($sql_query))
				{
					$error_msg.=$db->db_last_error().$sql_query;
					exit($error_msg);
				}
				echo '-';
				flush();
			}
		}
	}
	else
		$error_msg.=$db->db_last_error().' '.$sql_query;

	// **************************************************************
	// Serviceabteilungen Verteiler abgleichen
	$mlist_name='SERVICEABTEILUNGEN';
	$grp = new gruppe();
	if(!$grp->exists($mlist_name))
	{
		$grp->gruppe_kurzbz = $mlist_name;
		$grp->studiengang_kz = '0';
		$grp->bezeichnung = 'LeiterInnen der Serviceabt.';
		$grp->beschreibung = 'LeiterInnen der Serviceabteilungen';
		$grp->semester = '0';
		$grp->mailgrp = true;
		$grp->sichtbar = true;
		$grp->generiert = true;
		$grp->aktiv = true;
		$grp->lehre = false;
		$grp->insertamum = date('Y-m-d H:i:s');
		$grp->insertvon = 'mlists_generate';

		if(!$grp->save(true, false))
			die('Fehler: '.$grp->errormsg);
	}
	else
	{
		setGeneriert($mlist_name);
	}
	// Personen holen die nicht mehr in den Verteiler gehoeren
	echo $mlist_name.' wird abgeglichen!<BR>';
	flush();
	ob_flush();
	$sql_query="SELECT uid FROM public.tbl_benutzergruppe
				WHERE
					UPPER(gruppe_kurzbz)=UPPER('$mlist_name') AND
					uid NOT IN (SELECT mitarbeiter_uid
								FROM
									public.tbl_mitarbeiter
									JOIN public.tbl_benutzer ON (mitarbeiter_uid=uid)
									JOIN public.tbl_benutzerfunktion USING(uid)
									JOIN public.tbl_organisationseinheit USING(oe_kurzbz)
								WHERE tbl_benutzer.aktiv AND (funktion_kurzbz='Leitung') AND
								(tbl_benutzerfunktion.datum_von is null OR tbl_benutzerfunktion.datum_von<=now()) AND
								(tbl_benutzerfunktion.datum_bis is null OR tbl_benutzerfunktion.datum_bis>=now())
								AND tbl_organisationseinheit.organisationseinheittyp_kurzbz='Abteilung')";
	if(!($result = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error();
	while($row=$db->db_fetch_object($result))
	{
     	$sql_query="DELETE FROM public.tbl_benutzergruppe WHERE UPPER(gruppe_kurzbz)=UPPER('$mlist_name') AND uid='$row->uid'";
		if(!$db->db_query($sql_query))
			$error_msg.=$db->db_last_error().$sql_query;
		echo '-';
		flush();
	}
	// Personen holen die nicht im Verteiler sind
	echo '<BR>';
	$sql_query="SELECT distinct mitarbeiter_uid
								FROM
									public.tbl_mitarbeiter
									JOIN public.tbl_benutzer ON (mitarbeiter_uid=uid)
									JOIN public.tbl_benutzerfunktion USING(uid)
									JOIN public.tbl_organisationseinheit USING(oe_kurzbz)
								WHERE tbl_benutzer.aktiv AND (funktion_kurzbz='Leitung') AND
								(tbl_benutzerfunktion.datum_von is null OR tbl_benutzerfunktion.datum_von<=now()) AND
								(tbl_benutzerfunktion.datum_bis is null OR tbl_benutzerfunktion.datum_bis>=now())
								AND tbl_organisationseinheit.organisationseinheittyp_kurzbz='Abteilung'
								AND uid NOT IN (SELECT uid FROM public.tbl_benutzergruppe WHERE gruppe_kurzbz='$mlist_name')";
	if(!($result = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error();
	while($row=$db->db_fetch_object($result))
	{
     	$sql_query="INSERT INTO public.tbl_benutzergruppe(uid, gruppe_kurzbz, studiensemester_kurzbz, updateamum, updatevon, insertamum, insertvon) VALUES ('$row->mitarbeiter_uid','".strtoupper($mlist_name)."',null, null, null, now(), 'mlists_generate')";
		if(!$db->db_query($sql_query))
			$error_msg.=$db->db_last_error().$sql_query;
		echo '-';
		flush();
	}

	// **************************************************************
	// Mitarbeiter Sprachen Institut
	$mlist_name='SPRACHEN';

	$grp = new gruppe();
	if(!$grp->exists($mlist_name))
	{
		$grp->gruppe_kurzbz = $mlist_name;
		$grp->studiengang_kz = '0';
		$grp->bezeichnung = 'sprachen';
		$grp->beschreibung = 'Mitarbeiter des Instituts Sprachen und Kulturwissenschaften';
		$grp->semester = '0';
		$grp->mailgrp = true;
		$grp->sichtbar = true;
		$grp->generiert = true;
		$grp->aktiv = true;
		$grp->lehre = true;
		$grp->insertamum = date('Y-m-d H:i:s');
		$grp->insertvon = 'mlists_generate';

		if(!$grp->save(true, false))
			die('Fehler: '.$grp->errormsg);
	}
	else
	{
		setGeneriert($mlist_name);
	}


	// Lektoren holen die nicht mehr in den Verteiler gehoeren
	echo '<br>'.$mlist_name.' wird abgeglichen!';
	flush();

	$sql_query = "SELECT distinct uid
					FROM
						public.tbl_benutzer
						JOIN public.tbl_benutzerfunktion USING(uid)
						JOIN public.tbl_mitarbeiter ON(uid=mitarbeiter_uid)
					WHERE oe_kurzbz in('Sprachen')
					AND tbl_benutzer.aktiv
					AND (tbl_benutzerfunktion.datum_von<=now() OR tbl_benutzerfunktion.datum_von is null)
					AND (tbl_benutzerfunktion.datum_bis>=now() OR tbl_benutzerfunktion.datum_bis is null)";

	$sql_querys="DELETE FROM public.tbl_benutzergruppe WHERE gruppe_kurzbz='$mlist_name' AND uid NOT IN ($sql_query)";
	if(!$db->db_query($sql_querys))
	{
		$error_msg.=$db->db_last_error().' '.$sql_querys;
	}

	$sql_query.=" AND uid NOT IN (SELECT uid FROM public.tbl_benutzergruppe WHERE gruppe_kurzbz='$mlist_name')";
	if(!($result_oe = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error().' '.$sql_query;
	// Lektoren holen die nicht im Verteiler sind
	while($row_oe = $db->db_fetch_object($result_oe))
	{
	   	$sql_query="INSERT INTO public.tbl_benutzergruppe(uid, gruppe_kurzbz, insertamum, insertvon) VALUES ('$row_oe->uid','".$mlist_name."', now(), 'mlists_generate')";
		if(!$db->db_query($sql_query))
		{
			$error_msg.=$db->db_last_error().$sql_query;
		}
	}

	// **************************************************************
	//Mitarbeiter sprachen Institut
	$mlist_name='HUMANITIES';

	$grp = new gruppe();
	if(!$grp->exists($mlist_name))
	{
		$grp->gruppe_kurzbz = $mlist_name;
		$grp->studiengang_kz = '0';
		$grp->bezeichnung = 'humanities';
		$grp->beschreibung = 'Mitarbeiter des Instituts Sprachen und Kulturwissenschaften';
		$grp->semester = '0';
		$grp->mailgrp = true;
		$grp->sichtbar = true;
		$grp->generiert = true;
		$grp->aktiv = true;
		$grp->lehre = true;
		$grp->insertamum = date('Y-m-d H:i:s');
		$grp->insertvon = 'mlists_generate';

		if(!$grp->save(true, false))
			die('Fehler: '.$grp->errormsg);
	}
	else
	{
		setGeneriert($mlist_name);
	}


	// Lektoren holen die nicht mehr in den Verteiler gehoeren
	echo '<br>'.$mlist_name.' wird abgeglichen!';
	flush();

	$sql_query = "SELECT distinct uid
					FROM
						public.tbl_benutzer
						JOIN public.tbl_benutzerfunktion USING(uid)
						JOIN public.tbl_mitarbeiter ON(uid=mitarbeiter_uid)
					WHERE oe_kurzbz in('Sprachen')
					AND tbl_benutzer.aktiv
					AND (tbl_benutzerfunktion.datum_von<=now() OR tbl_benutzerfunktion.datum_von is null)
					AND (tbl_benutzerfunktion.datum_bis>=now() OR tbl_benutzerfunktion.datum_bis is null)";

	$sql_querys="DELETE FROM public.tbl_benutzergruppe WHERE gruppe_kurzbz='$mlist_name' AND uid NOT IN ($sql_query)";
	if(!$db->db_query($sql_querys))
	{
		$error_msg.=$db->db_last_error().' '.$sql_querys;
	}

	$sql_query.=" AND uid NOT IN (SELECT uid FROM public.tbl_benutzergruppe WHERE gruppe_kurzbz='$mlist_name')";
	if(!($result_oe = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error().' '.$sql_query;
	// Lektoren holen die nicht im Verteiler sind
	while($row_oe = $db->db_fetch_object($result_oe))
	{
	   	$sql_query="INSERT INTO public.tbl_benutzergruppe(uid, gruppe_kurzbz, insertamum, insertvon) VALUES ('$row_oe->uid','".$mlist_name."', now(), 'mlists_generate')";
		if(!$db->db_query($sql_query))
		{
			$error_msg.=$db->db_last_error().$sql_query;
		}
	}

	// **************************************************************
	//Kollegiumsverteiler
	$mlist_name='KOLLEGIUM';

	$grp = new gruppe();
	setGeneriert($mlist_name);

	// Personen holen die nicht mehr in den Verteiler gehoeren
	echo '<br>'.$mlist_name.' wird abgeglichen!';
	flush();

	$sql_query = "SELECT distinct uid
					FROM
						public.tbl_benutzer
						JOIN public.tbl_benutzerfunktion USING(uid)
					WHERE funktion_kurzbz='kollegium'
					AND tbl_benutzer.aktiv
					AND (tbl_benutzerfunktion.datum_von<=now() OR tbl_benutzerfunktion.datum_von is null)
					AND (tbl_benutzerfunktion.datum_bis>=now() OR tbl_benutzerfunktion.datum_bis is null)";

	$sql_querys="DELETE FROM public.tbl_benutzergruppe WHERE gruppe_kurzbz='$mlist_name' AND uid NOT IN ($sql_query)";
	if(!$db->db_query($sql_querys))
	{
		$error_msg.=$db->db_last_error().' '.$sql_querys;
	}

	$sql_query.=" AND uid NOT IN (SELECT uid FROM public.tbl_benutzergruppe WHERE gruppe_kurzbz='$mlist_name')";
	if(!($result_oe = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error().' '.$sql_query;
	// Personen holen die nicht im Verteiler sind
	while($row_oe = $db->db_fetch_object($result_oe))
	{
	   	$sql_query="INSERT INTO public.tbl_benutzergruppe(uid, gruppe_kurzbz, insertamum, insertvon) VALUES ('$row_oe->uid','".$mlist_name."', now(), 'mlists_generate')";
		if(!$db->db_query($sql_query))
		{
			$error_msg.=$db->db_last_error().$sql_query;
		}
	}

	// **************************************************************
	//Akademisches Managementteam
	$mlist_name='TW_MANAGEMENTTEAM';

	$grp = new gruppe();
	setGeneriert($mlist_name);

	// Personen holen die nicht mehr in den Verteiler gehoeren
	echo '<br>'.$mlist_name.' wird abgeglichen!';
	flush();

	$sql_query = "SELECT distinct uid
					FROM
						public.tbl_benutzer
						JOIN public.tbl_benutzerfunktion USING(uid)
					WHERE funktion_kurzbz='managementteam'
					AND tbl_benutzer.aktiv
					AND (tbl_benutzerfunktion.datum_von<=now() OR tbl_benutzerfunktion.datum_von is null)
					AND (tbl_benutzerfunktion.datum_bis>=now() OR tbl_benutzerfunktion.datum_bis is null)";

	$sql_querys="DELETE FROM public.tbl_benutzergruppe WHERE gruppe_kurzbz='$mlist_name' AND uid NOT IN ($sql_query)";
	if(!$db->db_query($sql_querys))
	{
		$error_msg.=$db->db_last_error().' '.$sql_querys;
	}

	$sql_query.=" AND uid NOT IN (SELECT uid FROM public.tbl_benutzergruppe WHERE gruppe_kurzbz='$mlist_name')";
	if(!($result_oe = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error().' '.$sql_query;
		// Personen holen die nicht im Verteiler sind
		while($row_oe = $db->db_fetch_object($result_oe))
		{
			$sql_query="INSERT INTO public.tbl_benutzergruppe(uid, gruppe_kurzbz, insertamum, insertvon) VALUES ('$row_oe->uid','".$mlist_name."', now(), 'mlists_generate')";
			if(!$db->db_query($sql_query))
			{
				$error_msg.=$db->db_last_error().$sql_query;
			}
		}

	// **************************************************************
	// FUE Mitarbeiter
	$mlist_name='TW_FUE';

	$grp = new gruppe();
	setGeneriert($mlist_name);

	// Personen holen die nicht mehr in den Verteiler gehoeren
	echo '<br>'.$mlist_name.' wird abgeglichen!';
	flush();

	$sql_query = "SELECT distinct uid
					FROM
						public.tbl_benutzer
						JOIN public.tbl_benutzerfunktion USING(uid)
					WHERE funktion_kurzbz='fue'
					AND tbl_benutzer.aktiv
					AND (tbl_benutzerfunktion.datum_von<=now() OR tbl_benutzerfunktion.datum_von is null)
					AND (tbl_benutzerfunktion.datum_bis>=now() OR tbl_benutzerfunktion.datum_bis is null)";

	$sql_querys="DELETE FROM public.tbl_benutzergruppe WHERE gruppe_kurzbz='$mlist_name' AND uid NOT IN ($sql_query)";
	if(!$db->db_query($sql_querys))
	{
		$error_msg.=$db->db_last_error().' '.$sql_querys;
	}

	$sql_query.=" AND uid NOT IN (SELECT uid FROM public.tbl_benutzergruppe WHERE gruppe_kurzbz='$mlist_name')";
	if(!($result_oe = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error().' '.$sql_query;
	// Personen holen die nicht im Verteiler sind
	while($row_oe = $db->db_fetch_object($result_oe))
	{
	   	$sql_query="INSERT INTO public.tbl_benutzergruppe(uid, gruppe_kurzbz, insertamum, insertvon) VALUES ('$row_oe->uid','".$mlist_name."', now(), 'mlists_generate')";
		if(!$db->db_query($sql_query))
		{
			$error_msg.=$db->db_last_error().$sql_query;
		}
	}

	// **************************************************************
	// FUE weibliche Mitarbeiterinnen
	$mlist_name='TW_FUE_FRAUEN';

	$grp = new gruppe();
	setGeneriert($mlist_name);

	// Personen holen die nicht mehr in den Verteiler gehoeren
	echo '<br>'.$mlist_name.' wird abgeglichen!';
	flush();

	$sql_query = "SELECT distinct uid
					FROM
						public.tbl_benutzer
						JOIN public.tbl_benutzerfunktion USING(uid)
						JOIN public.tbl_person USING (person_id)
					WHERE funktion_kurzbz='fue'
					AND geschlecht='w'
					AND tbl_benutzer.aktiv
					AND (tbl_benutzerfunktion.datum_von<=now() OR tbl_benutzerfunktion.datum_von is null)
					AND (tbl_benutzerfunktion.datum_bis>=now() OR tbl_benutzerfunktion.datum_bis is null)";

	$sql_querys="DELETE FROM public.tbl_benutzergruppe WHERE gruppe_kurzbz='$mlist_name' AND uid NOT IN ($sql_query)";
	if(!$db->db_query($sql_querys))
	{
		$error_msg.=$db->db_last_error().' '.$sql_querys;
	}

	$sql_query.=" AND uid NOT IN (SELECT uid FROM public.tbl_benutzergruppe WHERE gruppe_kurzbz='$mlist_name')";
	if(!($result_oe = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error().' '.$sql_query;
	// Personen holen die nicht im Verteiler sind
	while($row_oe = $db->db_fetch_object($result_oe))
	{
	   	$sql_query="INSERT INTO public.tbl_benutzergruppe(uid, gruppe_kurzbz, insertamum, insertvon) VALUES ('$row_oe->uid','".$mlist_name."', now(), 'mlists_generate')";
		if(!$db->db_query($sql_query))
		{
			$error_msg.=$db->db_last_error().$sql_query;
		}
	}

	// **************************************************************
	// Alle MA mit Funktion Leitung oder stvLeitung oder gfLtg
	$mlist_name='TW_LEITUNG';

	$grp = new gruppe();
	setGeneriert($mlist_name);

	// Personen holen die nicht mehr in den Verteiler gehoeren
	echo '<br>'.$mlist_name.' wird abgeglichen!';
	flush();

	$sql_query = "SELECT DISTINCT uid FROM tbl_person JOIN tbl_benutzer
					USING (person_id) JOIN tbl_benutzerfunktion USING (uid)
					WHERE funktion_kurzbz in('Leitung','stvLtg','gLtg')
					AND (tbl_benutzerfunktion.datum_von<=now() OR tbl_benutzerfunktion.datum_von is null)
					AND (tbl_benutzerfunktion.datum_bis>=now() OR tbl_benutzerfunktion.datum_bis is null)";

	$sql_querys="DELETE FROM public.tbl_benutzergruppe WHERE gruppe_kurzbz='$mlist_name' AND uid NOT IN ($sql_query)";
	if(!$db->db_query($sql_querys))
	{
		$error_msg.=$db->db_last_error().' '.$sql_querys;
	}

	$sql_query.=" AND uid NOT IN (SELECT uid FROM public.tbl_benutzergruppe WHERE gruppe_kurzbz='$mlist_name')";
	if(!($result_oe = $db->db_query($sql_query)))
		$error_msg.=$db->db_last_error().' '.$sql_query;
	// Personen holen die nicht im Verteiler sind
	while($row_oe = $db->db_fetch_object($result_oe))
	{
	   	$sql_query="INSERT INTO public.tbl_benutzergruppe(uid, gruppe_kurzbz, insertamum, insertvon) VALUES ('$row_oe->uid','".$mlist_name."', now(), 'mlists_generate')";
		if(!$db->db_query($sql_query))
		{
			$error_msg.=$db->db_last_error().$sql_query;
		}
	}

	echo $error_msg;
	?>
	<BR>
	<P>
  		Die Mailinglisten wurden abgeglichen. <BR>
  	</P>
</BODY>
</HTML>
