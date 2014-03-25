<?php
header( 'Expires:  -1' );
header( 'Last-Modified: ' . gmdate( 'D, d M Y H:i:s' ) . ' GMT' );
header( 'Cache-Control: no-store, no-cache, must-revalidate' );
header( 'Pragma: no-cache' );
header('Content-Type: text/html;charset=UTF-8');

require_once('../../../../config/vilesci.config.inc.php');
require_once('../../../../include/functions.inc.php');
require_once('../../../../include/pruefungCis.class.php');
require_once('../../../../include/lehrveranstaltung.class.php');
require_once('../../../../include/benutzerberechtigung.class.php');
require_once('../../../../include/pruefungsanmeldung.class.php');
require_once('../../../../include/pruefungstermin.class.php');
require_once('../../../../include/datum.class.php');
require_once('../../../../include/konto.class.php');

$uid = get_uid();

$rechte = new benutzerberechtigung();
$rechte->getBerechtigungen($uid);

//TODO Berechtigung
//if(!$rechte->isBerechtigt('lehre/pruefungsanmeldung'))
//	die('Sie haben keine Berechtigung für diese Seite');

$method = isset($_REQUEST['method'])?$_REQUEST['method']:'';

switch($method)
{
	case 'getPruefungByLv':
            $lehrveranstaltungen=$_REQUEST['lvIds'];
            $pruefung = new pruefungCis();
            if($pruefung->getPruefungByLv($lehrveranstaltungen))
            {
                    $pruefungen = array();
                    foreach($pruefung->lehrveranstaltungen as $lv)
                    {
                        //TODO Datenoverhead beseitigen
                        $lehrveranstaltung = new lehrveranstaltung($lv->lehrveranstaltung_id);
                        $prf = new stdClass();
                        $prf->pruefung = new pruefungCis($lv->pruefung_id);
                        $prf->lehrveranstaltung = $lehrveranstaltung;
                        array_push($pruefungen, $prf);
                    }

                    $data['result']=$pruefungen;
                    $data['error']='false';
                    $data['errormsg']='';
            }
            else
            {
                    $data['error']='true';
                    $data['errormsg']=$pruefung->errormsg;
            }
            break;
        case 'loadPruefung':
            $pruefung_id=$_REQUEST["pruefung_id"];
            $pruefung = new pruefungCis();
            if($pruefung->load($pruefung_id))
            {
                $data['result'] = array();
                array_push($data['result'], $pruefung);
                $data['error']='false';
                $data['errormsg']='';
            }
            else
            {
                $data['error']='true';
                $data['errormsg']=$pruefung->errormsg;
            }
            
            break;
        case 'loadTermine':
            $pruefung_id=$_REQUEST["pruefung_id"];
            $pruefung = new pruefungCis($pruefung_id);
            if($pruefung->getTermineByPruefung($pruefung_id))
            {
                $data['result'] = $pruefung->termine;
                $data['error']='false';
                $data['errormsg']='';
            }
            else
            {
                $data['error']='true';
                $data['errormsg']=$pruefung->errormsg;
            }
            
            break;
        case 'saveAnmeldung':
            $termin = new pruefungstermin($_REQUEST["termin_id"]);
            if($termin->teilnehmer_max > $termin->getNumberOfParticipants() || $termin->teilnehmer_max == NULL)
            {
                $anmeldung = new pruefungsanmeldung();
                $anmeldung->lehrveranstaltung_id = $_REQUEST["lehrveranstaltung_id"];
                $anmeldung->pruefungstermin_id = $_REQUEST["termin_id"];
                $anmeldung->wuensche = $_REQUEST["bemerkung"];
                $anmeldung->uid = $uid;
		$anmeldung->status = "angemeldet";
                
                $studiensemester_kurbz = $_REQUEST['studiensemester_kurzbz'];
                
		$lehrveranstaltung = new lehrveranstaltung($_REQUEST["lehrveranstaltung_id"]);
                
                $konto = new konto();
                $creditpoints = $konto->getCreditPoints($uid, $studiensemester_kurzbz);
		$creditpoints = 1.5;
		if($creditpoints !== false)
		{
		    if($creditpoints < $lehrveranstaltung->ects)
		    {
		    $data['error'] = 'true';
                    $data['errormsg'] = 'Credit-Points-Guthaben ist zu gering.';
                    break;
		    }
		}
                
                //Kollisionsprüfung
                $anmeldungen = $anmeldung->getAnmeldungenByStudent($uid);
                foreach($anmeldungen as $temp)
                {
                    $datum = new datum();
                    if(($datum->between($termin->von, $termin->bis, $temp->von)) || ($datum->between($termin->von, $termin->bis, $temp->bis)))
                    {
                        $data['result'][$temp->pruefungstermin_id] = "true";
                        $data['error'] = 'true';
                        $data['errormsg'] = 'Kollision mit anderer Anmeldung.';
                    }
                }
                if(isset($data['error']) && $data['error'] = 'true')
                {
                    break;
                }
            }
            else
            {
                $data['error']='true';
                $data['errormsg']='Keine freien Plätze vorhanden.';
                break;
            }
            
            if($anmeldung->save(true))
            {
                $data['result'] = "Anmeldung erfolgreich!";
                $data['error']='false';
                $data['errormsg']='';
            }
            else
            {
                $data['error']='true';
                $data['errormsg']=$anmeldung->errormsg;
            }
            break;
	default:
		break;
}

echo json_encode($data);
?>