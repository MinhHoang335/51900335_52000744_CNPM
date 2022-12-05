<?php session_start();
      include('include/dbcon.php');
 ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>Car For Rent Management System | Admin - Dashboard</title>

  <link href="css/mdb.min.css" rel="stylesheet">
  <link href="css/bootstrap.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <style>
        
        @media (min-width:320px) and (max-width:768px){
            #image{
                background-image:none;
            }
        }
        @media (min-width:800px){
            #image{
                background-image:url('img/bmw_login_banner.jpg');
                height:150vh;
                background-size: 1100px 800px; 
                opacity:0.7;
            }
        }
 </style>
  
</head>
<?php
      if(isset($_POST['signin'])){
      $email  = mysqli_real_escape_string($con,$_POST['email']);    
      $password  = mysqli_real_escape_string($con,$_POST['password']);  

      $query = "SELECT * FROM admin";
      $run   = mysqli_query($con,$query);
        
      $row   = mysqli_fetch_array($run);
      $db_admin_id  = $row['id'];
      $db_admin_name = $row['name'];
      $db_admin_email = $row['email'];
      $db_admin_password = $row['password'];

      if($email == $db_admin_email && $password == $db_admin_password){

        $_SESSION['id']         = $db_admin_id;
        $_SESSION['name']       = $db_admin_name;
        $_SESSION['email']      = $db_admin_email;
        $_SESSION['password']   = $db_admin_password;
        
            header('location: index.php'); 

      }else{
        $error = "Invalid Email or Password";
      }
    }
?>

<div class="container-fluid">
  <div class="row">
    <div class="col-lg-6 col-md-0" id="image"></div>
    <div class="col-md-12 col-lg-6 col-12 mt-5">
      <div class="login d-flex align-items-center py-5">

        <div class="container mt-5">
          <div class="row">
            <div class="col-md-9 col-lg-8 mx-auto">
              <h1 class="login-heading text-center mb-2">Welcom to</h1>
              <h3 class="login-heading text-center mb-4">Car For Rent Management System</h3>
              <form method="post">
              <?php
              if(isset($error)){
                      
                      echo "<div class='alert bg-danger' role='alert'>
                              <span class='text-white text-center'> $error</span>
                                <button type='button' class='close' data-dismiss='alert' aria-label='Close'>
                                  <span aria-hidden='true'>&times;</span>
                                </button>
                            </div>";
                  
                      }
                      ?>
                <div class="form-group">
                 <label for="email">Email</label>
                 <input type="email" name="email" class="form-control" placeholder="Email address" required autofocus>
                </div>

                <div class="form-group">
                  <label for="password">Mật khẩu</label>
                  <input type="password" name="password" class="form-control" placeholder="Password" required>
                </div>

                
                <input class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" type="submit" value="Đăng nhập" name="signin">
                <div class="text-center">
                  <a class="small" href="#">Quên mật khẩu?</a></div>

              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
