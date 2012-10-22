<?php

/* Copyright (C) 2012 FH Technikum-Wien
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
 * Authors: Karl Burkhart 	<burkhart@technikum-wien.at>
 */



require_once('../../config/cis.config.inc.php');
require_once('../../include/phrasen.class.php');
require_once('../../include/functions.inc.php');
require_once('../../include/coodle.class.php');

if(isset($_GET['lang']))
	setSprache($_GET['lang']);

$sprache = getSprache(); 
$p=new phrasen($sprache); 

$message = '';

$coodle_id = (isset($_GET['coodle_id'])?$_GET['coodle_id']:'');

$coodle = new coodle(); 
if(!$coodle->load($coodle_id))
    die($coodle->errormsg); 

// authentifizierung
if(!isset($_GET['zugangscode']))
    $uid = get_uid(); 

// checkboxen speichern
if(isset ($_POST['save']))
{
    $coodle_help = new coodle(); 
    
    // Ressource ID von Zugangscode oder UID holen und Beiträge löschen
    if(isset($_GET['zugangscode']))
    {
        
        $coodle_help->getRessourceFromUser($coodle_id, '', $_GET['zugangscode']);
        $coodle_ressource_termin= $coodle_help->deleteRessourceTermin($coodle_help->coodle_ressource_id, $coodle_id);  
    }
    else
    {
        if($coodle_help->RessourceExists($coodle_id, $uid))
        {
            $coodle_help->getRessourceFromUser($coodle_id, $uid);
            $coodle_ressource_termin= $coodle_help->deleteRessourceTermin($coodle_help->coodle_ressource_id, $coodle_id);
        }
    }
    
    //  Einträge speichern
    foreach($_POST as $key=>$value)
    {
        if(mb_substr($key, 0, 5) =='check')
        {
            $termin = explode('_', $key);
            $ressource_id = $termin[1];
            $termin_id = $termin[2];
            
            $coodle_ressource_termin = new coodle(); 
            $coodle_ressource_termin->coodle_ressource_id = $ressource_id;
            $coodle_ressource_termin->coodle_termin_id = $termin_id; 
            $coodle_ressource_termin->new = true; 

            if(!$coodle_ressource_termin->saveRessourceTermin())
                $message= "Fehler beim Speichern aufgetreten"; 
            else
                $message = "Erfolgreich gespeichert"; 
        }
    }
}

?>

<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>Coodle Übersicht</title>
<style type="text/css">
    body {
	background: #f9f9f9;
	color: #000;
	font: 14px Arial;
	margin: 0 auto;
	padding: 0;
	position: relative;
}
h1,h2,h3,h4,h5,h6{ color:#008462;}

h5 {margin-top:0px; }
.container {width: 100%; }
#header {
	background: #DCDDDF;;
	border: 1px solid #c4c6ca;
	position: relative;
    padding-left: 50px; 
	width: 100%;
}
</style>

</head>
<body>
<div class="container">
    <section id="header">
        <?php 
        $coodle_help = new coodle(); 
        $coodle_help->load($coodle_id); 
  
        $alt = strtotime($coodle_help->insertamum) ;

        $differenz = time() - $alt;
        $differenz = $differenz / 86400;

        
        echo '<h1>'.$coodle->titel.'</h1>'; 
        echo '<h5>Erstellt von '.$coodle->ersteller_uid.' ( vor '.round($differenz).' Tagen)</h5>';
        echo '<h4>'.$coodle->beschreibung.'</h4>';
        ?>
    </section>
</div>
    <div class="main">
        <?php
        $coodle_ressourcen = new coodle(); 
        $coodle_ressourcen->getRessourcen($coodle_id);
        
        // alle termine der coodle umfrage holen
        $coodle_termine = new coodle(); 
        $coodle_termine->getTermine($coodle_id);
        
        echo "
            <div class='container'>
                <section id='content'>
                    <form action='' method='POST'>

                <table>
                <tr><td></td>";
        foreach($coodle_termine->result as $termin)
            echo "<td>".$termin->datum.' '.$termin->uhrzeit."</td>";
        
        echo "</tr>";
        
        // ressourcen durchlaufen
        foreach($coodle_ressourcen->result as $ressource)
        {
            $name = '';
            if($ressource->uid != '')
                $name = $ressource->uid; 
            
            if($ressource->zugangscode !='')
                $name = $ressource->name; 
            
            echo "<tr><td>".$name."</td>";
            // termine zu ressourcen anzeigen
            foreach($coodle_termine->result as $termin)
            {
                $checked ='';
                $disabled='';
                if($coodle_termine->checkTermin($termin->coodle_termin_id, $ressource->coodle_ressource_id))
                        $checked = 'checked';
                
                $coodle_help = new coodle();
                if(isset($_GET['zugangscode']))
                {
                    $coodle_help->getRessourceFromUser($coodle_id, '', $_GET['zugangscode']);
                    if($ressource->coodle_ressource_id != $coodle_help->coodle_ressource_id)
                        $disabled = 'disabled'; 
                }else
                {
                    $coodle_help->getRessourceFromUser($coodle_id, $uid);
                    if($ressource->coodle_ressource_id != $coodle_help->coodle_ressource_id)
                        $disabled = 'disabled'; 
                }
                
                echo "<td align='center'><input type='checkbox' ".$checked." ".$disabled." name='check_".$ressource->coodle_ressource_id."_".$termin->coodle_termin_id."'></td>";
            }
            
            echo "</tr>";
        }
        
        echo "
            
            <tr><td><input type='submit' value='save' name='save'></td></tr>
            </table>
            </form></section></div>";

        ?>
    </div>
    
    
</body>
</html>

