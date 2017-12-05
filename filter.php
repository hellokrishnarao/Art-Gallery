<?php
include('db.php');
$filter_input = $_POST['filter_input'];
$where = "";
$sql = "select * from users $where";
$res = mysql_query($sql);
$num_rows = mysql_num_rows($res);

if ($num_rows > 0) {
    // output data of each row
    while($result = mysql_fetch_array($res)) {
		$status = ($result['status'] == 1)?'Active':'Inactive';
        echo $html = "Table to be printed";
    }
} else {
    echo "No Record Found";
} 

?>