<?php

  require_once 'db.php';
  $error ="";
  if(isset($_POST['submit']))
  {
    $feedback = $_POST['feedback'];
    $email = $_POST['email'];
  //  echo $email;
    $query = "INSERT INTO `email` VALUES ('$email','$feedback')";  //add code here to update feedback section as well.
    
    $result = mysqli_query($con , $query);
    //$sql = "call newproc('$email','$feedback')";
   // echo $sql;
   // $result = mysqli_query($con , $sql);
    $result = mysqli_num_rows($result);
    if($result)
    {
      $error = "submitted";
    }
   // $error = "Submitted";
  }
    else 
    {

      $error ="Inavlid Email Syntax";
    }
  


?>

<!DOCTYPE html>
<html lang="">
<head>
<title>Art Gallery</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top" style="background-image:url('images/demo/background.jpg');">
<style type="text/css">
	#mainav{
		background-color: #D4AF37;

	}
	.footbtn{
		background-color:#D4AF37;
		border: 1px solid #D4AF37;
	}

</style>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row1">

  <nav id="mainav" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <ul class="clear">
      <li><a href="index.php">Home</a></li>
      <li><a href="gallery1.php">Gallery</a></li>
      <li class="active"><a href="#">Contact Us</a></li>
   
    </ul>
    <!-- ################################################################################################ -->
  </nav>
</div>
<div class="wrapper row4 bgded overlay" style="background-image:url('images/demo/background.jpg'); height:680px ;">
  <footer id="footer" class="hoc clear"> 
    <!-- ################################################################################################ -->
    
    <!-- ################################################################################################ -->
    <hr class="btmspace-50">
    <!-- ################################################################################################ -->
    <div class="group">
      <div class="one_third first">
        <h6 class="heading">Address</h6>
        <ul class="nospace btmspace-30 linklist contact">
          <li><i class="fa fa-map-marker"></i>
            <address>
            Rue de Rivoli &amp; 75001, Paris, France
            </address>
          </li>
          <li><i class="fa fa-phone"></i> +33 (123) 456 7890</li>
          <li><i class="fa fa-fax"></i> +33 (123) 676 7560</li>
          
        </ul>
      </div>
      
      <div class="one_third">
        <h6 class="heading">Email</h6>
        <p class="nospace btmspace-30">Please enter your email address and any feedback you would like to give us about your visit or experience.</p>
        <form method="post" action="#">
          <fieldset>
            <legend>Newsletter:</legend>
            <input class="btmspace-15" name="email" type="text" value="" placeholder="Email">
            <textarea class="btmspace-15" name="feedback" placeholder="Feedback" rows="10" cols="50"></textarea>
          <!--  <div class="errorDiv"><?php echo $error; ?></div> -->
            <button type="submit" name="submit" value="submit">Submit</button>
          </fieldset>
        </form>
      </div>
    </div>
    <!-- ################################################################################################ -->
  </footer>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
<script src="layout/scripts/jquery.flexslider-min.js"></script>
</body>
</html>