<?php 
	require_once('conf/top.php');

	$template = $tpl->loadTemplate('search.html');

	/* ici le code php traitant le moteur de recherche */

	connectDb();
	function getAllPlats() {
        // on fait un left join au lieu d'un inner join car on veut aussi les plats qui ne sont pas dans un menu
    	$sql = 'SELECT plat.id_plat,plat.nom,plat.description,plat.prix, type.nom as type, menu.nom as menu from plat
                INNER JOIN type ON type.id_type = plat.id_type 
                LEFT JOIN menu ON menu.id_menu = plat.id_menu';    	
    	$result = mysql_query($sql);
		$results = array();
		while ($ligne = mysql_fetch_assoc($result)) {
			$results[] = $ligne;
		}
		return $results;
    }
	$plats=getAllPlats();

	/* on envoie les infos necessaires */

	echo $template->render(array('ASSETS_PATH'=>ASSETS_PATH, 'plats'=>$plats));

