<?php
// fonctions en bordel en attendant d'etre triées dans d'autre fichiers php


function getAllProducts() {
        // on fait un left join au lieu d'un inner join car on veut aussi les plats qui ne sont pas dans un menu
        $sql = 'SELECT nom FROM Produit';     
        $result = mysql_query($sql);
        $results = array();
        while ($ligne = mysql_fetch_assoc($result)) {
            $results[] = $ligne;
        }
        return $results;
    }