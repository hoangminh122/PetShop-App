<?php
include('connect.php');

$json=$_POST['json'];
//$json='[{"giasanpham":76775,"madonhang":"5","soluongsanpham":1,"tensanpham":"banhpizza","masanpham":20},{"giasanpham":2342,"madonhang":"2","soluongsanpham":6,"tensanpham":"banhpizza2","masanpham":2}]';
$data=json_decode($json,true);
foreach($data as $value)
{
	$madonhang=$value['madonhang'];
	$masanpham=$value['masanpham'];
	$tensanpham=$value['tensanpham'];
	$giasanpham=$value['giasanpham'];
	$soluongsanpham=$value['soluongsanpham'];
	$query="INSERT INTO bills(id_customer,total,note) VALUES ('SELECT SCOPE_IDENTITY();','$giasanpham','DHANG tren DIEN THOAI')";
$Data=mysqli_query($conn,$query);
if($Data)
{
   
    $query1="INSERT INTO bill_detail(id_bill,id_product,quantity,unit_price) VALUES ('SELECT SCOPE_IDENTITY();','$masanpham','$soluongsanpham','$giasanpham')";

    $Data1=mysqli_query($conn,$query1);

   

}



}
if($Data1)
{
	echo "1";
}
else
{
	echo "0";
}



?>