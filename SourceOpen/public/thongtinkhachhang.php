<?php
include('connect.php');
$tenkhachhang=$_POST['tenkhachhang'];
$sodienthoai=$_POST['sodienthoai'];
$email=$_POST['email'];

if(strlen($tenkhachhang) >0 && strlen($email)>0 &&strlen($sodienthoai)>0)
{
	$query="INSERT INTO customer(name,email,phone_number) VALUES('$tenkhachhang','$email','$sodienthoai')";
	if(mysqli_query($conn,$query))
     {
     	$iddonhang=$conn->insert_id;
     	echo $iddonhang;


     }
     else
     {
     	echo "thatbai";
     }

}
else
{
	echo "kiem tra lai du lieu";
}
?>
