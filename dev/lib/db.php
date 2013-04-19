<?php

	function connectDb() {
		try {
        	$db = mysql_connect(DB_SERVER . ':' . DB_PORT, DB_USER, DB_PASS);
			mysql_select_db(DB_BASE, $db);
			mysql_query("SET NAMES 'utf8' COLLATE 'utf8_unicode_ci'");
        } catch(Exception $e) {
            die("Database not found");
        }
    }

    function fetch($sql) {
		$result = mysql_query($sql);
		$results = array() ;
		while ($ligne = mysql_fetch_array($result)) {
			$results[] = $ligne;
		}
		mysql_free_result($result) ;
		return $results ;
	}



		