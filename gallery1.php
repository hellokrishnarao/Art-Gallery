<?php
require_once('db.php');

$query = "select artist_fname, artist_lname from artist";   
$res = mysqli_query($con, $query);
$num_rows = mysqli_num_rows($res);



?>
<!DOCTYPE html>
<html lang="">

<head>
  <title>Gallery</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<!-- start of css part -->
<style type="text/css">
  .btn {
    cursor: default;
   
    border-radius: 4px;
    text-align: left;
  }
  
  .caret {
    position: absolute;
    right: 16px;
    top: 16px;
  }
  
  .btn-default:hover,
  .btn-default:focus,
  .btn-default:active,
  .btn-default.active,
  .open .dropdown-toggle.btn-default {
    background-color: #FFF;
  }
  
  .btn-group.open .dropdown-toggle {
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 8px rgba(102, 175, 233, 0.6)
  }
  
  .btn-group {
    width: 100%
  }
  
  .dropdown-menu {
    width: 100%;
  }
</style>

<body id="top">
  <style type="text/css">
    #mainav {
      background-color: #D4AF37;

    }
    
    .footbtn {
      background-color: #D4AF37;
      border: 1px solid #D4AF37;
    }
    .one_quarter{
      padding: 0px;
      padding-right: 0px;
      margin-right: 55px;
    }
   
    .one_quarter{
      margin-top: -80px;
    }
    .btn{
      color: ;

    }

  </style>
  <!-- End of css part -->
  <!-- ################################################################################################ -->
  
  <!-- ################################################################################################ -->
  </header>
  <!-- ################################################################################################ -->
  <nav id="mainav" class="hoc clear">

    <!-- Items in the navigation bar -->

    <ul class="clear">
      <li><a href="index.php">Home</a></li>
      <li class="active"><a href="#">Gallery</a></li>
      <li><a href="contact.php">Contact Us</a></li>
      
    </ul>
    <!-- End of navigation bar -->
  </nav>
  <!-- ################################################################################################ -->
  </div>
  <!-- ################################################################################################ -->
  <!-- ################################################################################################ -->
  <!-- Paste code here if problem  ##################################################################################### -->
  <!-- ################################################################################################ -->
  <div class="wrapper row3">
    <main class="hoc container clear">
      <!-- main body -->
      <!-- ################################################################################################ -->
      <div class="content">
        <!-- ################################################################################################ -->
        <div id="gallery">
          <figure>
            <header class="heading" style="margin-top: -50px">Filters</header>
             <form class="form-group" method="post" action="#">
                  <div class="form-group">
                    <label for="sel1">Artist</label>
                    <select class="form-control" id="sel1" name="artist">
                       <option>All</option>
                      <?php
                      while($result = mysqli_fetch_array($res)){
                       echo "<option>".$result['artist_fname']./*" ".$result['artist_lname'].*/"</option>";
                     }?>
                          

                    </select>
                  </div>
                  <div class="form-group">
                    <label for="sel2">Style</label>
                    <select class="form-control" id="sel2" name="style">
                      <option>All</option>
                        <?php
                        $query = "select style_name from style";   
                        $res = mysqli_query($con, $query);
                        $num_rows = mysqli_num_rows($res);
                      while($result = mysqli_fetch_array($res)){
                       echo "<option>".$result['style_name']."</option>";
                     }?>
                    </select>
                  </div>
                  <div class="form-group">
                    <button class="btn btn-info" name="submit" onclick="filter_data();">Apply Filters</button>
                  </div>
            </form>
            <?php if (isset($_POST['submit'])) {

                $artist= $_POST['artist'];
                $style=$_POST['style'];

            }
             else{
               $artist='';
             }
            ?>
          </figure>
        </div>
      </div>
   
            <ul class="nospace clear">
 <?php                     
                        $first = 'first';
                        $query = "select artist_id from artist where artist_fname='$artist'";   
                        $res = mysqli_query($con, $query);
                        $result = mysqli_fetch_array($res);
                        $artist_id = $result['artist_id'];
                       
 if(isset($_POST['submit']) && $_POST['artist']!='All')
                       {
                        $query = "select * from painting where artist_id=$artist_id";
                        $res = mysqli_query($con, $query);
                        $i=0;
                        while ($painting = mysqli_fetch_array($res)) 
                        {
                          
                        
                        $paint = $painting['painting_name'];
                        $paint_info = trim(strip_tags(htmlspecialchars($painting['info'])));
                        $img_name = $painting['img_name'];

echo <<<EOT
            
              <li class="one_quarter img1">
                <a href="#">
                  <div class="container">
                    <!-- Trigger the modal with a button -->
                    <button type="button" class="btn btn-info btn-lg butn" data-toggle="modal" data-target="#myModal$i"><img src="gallery/$img_name" style="width:250px; height:250px;" alt=""></button>
                    <!-- Modal -->
                    <div class="modal fade" id="myModal$i" role="dialog">
                      <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title"> $paint </h4> </div>
                          <div class="modal-body">
                            <p>$paint_info</p>
                            <img src="gallery/$img_name" alt="">
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </a>
              </li> 
             

EOT;
$i++;
$first='';
}}


                        
else if(isset($_POST['submit']) && $_POST['style']!='All')

                       {
                        $query = "select style_id from style where style_name='$style'";   
                        $res = mysqli_query($con, $query);
                        $result = mysqli_fetch_array($res);
                        $style_id = $result['style_id'];

                       

                        $query = "select * from painting where style_id='$style_id'";   
                        $res = mysqli_query($con, $query);
                        $result = mysqli_fetch_assoc($res);
                        $style_id = $result['style_id'];
                        $i=0;
                        while ($painting = mysqli_fetch_array($res)) 
                        {
                          
                        
                        $paint = $painting['painting_name'];
                        $paint_info = trim(strip_tags(htmlspecialchars($painting['info'])));
                        $img_name = $painting['img_name'];

echo <<<EOT
            
              <li class="one_quarter img1">
                <a href="#">
                  <div class="container">
                    <!-- Trigger the modal with a button -->
                    <button type="button" class="btn btn-info btn-lg butn" data-toggle="modal" data-target="#myModal$i"><img src="gallery/$img_name" style="width:250px; height:250px;" alt=""></button>
                    <!-- Modal -->
                    <div class="modal fade" id="myModal$i" role="dialog">
                      <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title"> $paint </h4> </div>
                          <div class="modal-body">
                            <p>$paint_info</p>
                            <img src="gallery/$img_name" alt="">
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </a>
              </li> 
             

EOT;
$i++;

}}

 

else if ((isset($_POST['submit']) && $_POST['artist']=='All') || empty($_POST['submit']))
                       {
                        $query = "select * from painting";
                        $res = mysqli_query($con, $query);
                        $i=0;
                        while ($painting = mysqli_fetch_array($res)) 
                        {
                          
                        
                        $paint = $painting['painting_name'];
                        $paint_info = $painting['info'];
                        $img_name = $painting['img_name'];

echo <<<EOT

              <li class="one_quarter img1">
                <a href="#">
                  <div class="container">
                    <!-- Trigger the modal with a button -->
                    <button type="button" class="btn btn-info btn-lg butn" data-toggle="modal" data-target="#myModal$i"><img src="gallery/$img_name" style="width:250px; height:250px;" alt=""></button>
                    <!-- Modal -->
                    <div class="modal fade" id="myModal$i" role="dialog">
                      <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title"> $paint </h4> </div>
                          <div class="modal-body">
                            <p>$paint_info</p>
                            <img src="gallery/$img_name" alt="">
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </a>
              </li> 
             

EOT;
$i++;
$first='';
}}
?>

           
            </ul>
          </figure>
        </div>
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        
        <!-- ################################################################################################ -->
      </div>
      <!-- ################################################################################################ -->
      <!-- / main body -->
      <div class="clear"></div>
    </main>
  </div>
  <!-- ################################################################################################ -->
  <!-- ################################################################################################ -->
  <!-- ################################################################################################ -->
  </footer>
  </div>
  <!-- ################################################################################################ -->
  <!-- ################################################################################################ -->

  <!-- ################################################################################################ -->
  <!-- ################################################################################################ --><a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
  <!-- JAVASCRIPTS -->
  <script type="text/javascript">
    $('.dropdown').on('click', '.dropdown-menu li a', function () {
      var target = $(this).html();
      //Adds active class to selected item
      $(this).parents('.dropdown-menu').find('li').removeClass('active');
      $(this).parent('li').addClass('active');
      //Displays selected text on dropdown-toggle button
      $(this).parents('.dropdown').find('.dropdown-toggle').html(target + ' <span class="caret"></span>');
    });
  </script>
<script>
function filter_data()
{
  var filter_input = $('#filter_input').val();
 // alert(filter_input);
  $.ajax({
    'type': 'POST',
    'url' : 'filter.php',
    'data' : 'filter_input='+filter_input,  
    success : function(result)
    {
      $('#userData').html(result);
    }
  });
}
  
</script>
  <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
  <script src="../layout/scripts/jquery.min.js"></script>
  <script src="../layout/scripts/jquery.backtotop.js"></script>
  <script src="../layout/scripts/jquery.mobilemenu.js"></script>
</body>

</html>