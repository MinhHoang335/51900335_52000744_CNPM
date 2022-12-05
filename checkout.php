<?php include('include/header.php'); ?>

<div class="jumbotron">
  <h2 class="text-center mt-5">Thuê xe</h2>
</div>


<div class="container">
  <?php
  if (isset($_SESSION['id'])) {
    $customer_id    = $_SESSION['id'];
    $customer_email = $_SESSION['email'];
    $customer_name  = $_SESSION['name'];
    $customer_add   = $_SESSION['add'];
    $customer_city  = $_SESSION['city'];
    $customer_pcode =   $_SESSION['pcode'];
    $customer_number =   $_SESSION['number'];

    $sub_total = 0;
    $shipping_cost = 0;
    $total = 0;

    if (isset($_POST['checkout'])) {
      $fullname = $_POST['fullname'];
      $address  = $_POST['address'];
      $city     = $_POST['city'];
      $code     = $_POST['code'];
      $number   = $_POST['phone_number'];
      $invoice  = mt_rand();
      $date     = date("d-m-Y");


      $cartt = "SELECT * FROM cart WHERE cust_id='$customer_id'";
      $run  = mysqli_query($con, $cartt);
      if (mysqli_num_rows($run) > 0) {
        while ($row = mysqli_fetch_array($run)) {
          $db_pro_id  = $row['product_id'];
          $db_pro_qty  = $row['quantity'];
          $bdate  = $cart_row['bdate'];
          $rdate  = $cart_row['rdate'];

          $pr_query  = "SELECT * FROM furniture_product WHERE pid=$db_pro_id";
          $pr_run    = mysqli_query($con, $pr_query);
          if (mysqli_num_rows($pr_run) > 0) {
            while ($pr_row = mysqli_fetch_array($pr_run)) {

              $price = $pr_row['price'];
              $arrPrice = array($pr_row['price']);
             
              $single_pro_total_price = $db_pro_qty * $price;

              $checkout_query  = "INSERT INTO `customer_order`(`customer_id`, `customer_email`,
              `customer_fullname`, `customer_address`, `customer_city`, `customer_pcode`, `customer_phonenumber`,
              `product_id`, `product_amount`, `invoice_no`, `products_qty`, `order_date`, `order_status`)
              VALUES('$customer_id','$customer_email','$fullname','$address','$city','$code','$number',$db_pro_id,
              $single_pro_total_price,'$invoice',$db_pro_qty,'$date','pending')";

              if (mysqli_query($con, $checkout_query)) {
                $del_query = "DELETE FROM cart where cust_id = $customer_id";
                if (mysqli_query($con, $del_query)) {
                  $_SESSION['message'] = "<div class='alert alert-primary alert-dismissible fade show pt-1 pb-1 pl-3' role='alert'>
                          <strong><i class='fas fa-check-circle'></i> Thanks! </strong>for your order,It will be deliver within 7 working days.
                          <button type='button' class='close p-2' data-dismiss='alert' aria-label='Close'>
                            <span aria-hidden='true'>&times;</span>
                          </button></div>";
                  header('location:customer/orders.php');
                }
              }
            }
          }
        }
      }
    }





  ?>
    <h1>Kiểm tra đơn</h1>
    <div class="row">
      <!--shopping cart-->
      <div class="col-md-6 p-3">
        <h5>Chi tiết đơn</h5>
        <hr>

        <div class="form-group">
          <label for="email"><b>Email:</b></label>
          <label><b><?php echo $customer_email; ?></b></label>
        </div>

        <form method="post" class="mt-4">
          <div class="form-group">
            <label for="fullname">Họ và tên:</label>
            <input type="text" name="fullname" placeholder="Full Name" class="form-control" value="<?php echo $customer_name; ?>" required>
          </div>

          <div class="form-group">
            <label for="address">Địa chỉ:</label>
            <input type="text" name="address" placeholder="Address" value="<?php echo $customer_add; ?>" class="form-control">
          </div>

          <div class="row">
            <div class="col-md-6 col-6">
              <div class="form-group">
                <label for="city">Thành phố:</label>
                <input type="text" name="city" placeholder="City" class="form-control" value="<?php echo $customer_city; ?>" required>
              </div>
            </div>

            <div class="col-md-6 col-6">
              <div class="form-group">
                <label for="postalcode">Postal code:</label>
                <input type="number" name="code" placeholder="Postal code" class="form-control" value="<?php echo $customer_pcode; ?>" required>
              </div>
            </div>

          </div>

          <div class="form-group">
            <label for="number">Số điện thoại:</label>
            <input type="number" name="phone_number" placeholder="Phone Number" class="form-control" value="<?php echo $customer_number; ?>" required>
          </div>

          <div class="form-group text-center mt-2">
            <input type="submit" name="checkout" class="btn btn-primary btn-block p-2" value="Đặt xe" id="border-less">
          </div>
          <div class="form-group text-center mt-4">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
            Thanh Toán Online
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Thanh Toán Online</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                  <a> 1. Zalo/gọi: 0941357075 để báo trước/sau khi chuyển</a>
                    <a> Quý khách chuyển qua</a></br>
                    <a> - Vietcombank (chi nhánh Quảng Ngãi)</a></br>
                    <a> Số TK: 0271001100028</a></br>
                    <a> Chủ TK: Đoàn Thái Minh Hoàng</a></br>
                    <a> Hoặc Momo: 0941357075</a></br>

                    <a> 2. Zalo/gọi: 0941357075 để báo trước/sau khi chuyển</a>

                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>

        </form>
      </div>

      <!--end cart--->

      <!--shopping Detail-->
      <div class="col-md-6 p-3">
        <!-- cart-->
        <table class="table table-responsive table-hover ">
          <h5>Chi tiết đặt hàng</h5>
          <hr>

          <tbody>
            <?php
            $cart = "SELECT * FROM cart WHERE cust_id='$customer_id'";
            $run  = mysqli_query($con, $cart);
            if (mysqli_num_rows($run) > 0) {
              while ($cart_row = mysqli_fetch_array($run)) {
                $db_cust_id = $cart_row['cust_id'];
                $db_pro_id  = $cart_row['product_id'];
                $db_pro_qty  = $cart_row['quantity'];

                $pr_query  = "SELECT * FROM furniture_product WHERE pid=$db_pro_id";
                $pr_run    = mysqli_query($con, $pr_query);

                if (mysqli_num_rows($pr_run) > 0) {
                  while ($pr_row = mysqli_fetch_array($pr_run)) {
                    $pid = $pr_row['pid'];
                    $title = $pr_row['title'];
                    $price = $pr_row['price'];
                    $arrPrice = array($pr_row['price']);
                    $size = $pr_row['size'];
                    $img1 = $pr_row['image'];

                    $single_pro_total_price = $db_pro_qty * $price;
                    $pro_total_price = array($db_pro_qty * $price);
                    $each_pr = implode($pro_total_price);
                    //   $values = array_sum($arrPrice);
                    $shipping_cost = 0;
                    $values = array_sum($pro_total_price);
                    $sub_total += $values;
                    $total = $sub_total + $shipping_cost;




            ?>
                    <div class="row">
                      <!--Image-->
                      <div class="col-md-3 col-3">
                        <img src="img/<?php echo $img1; ?>" width="100%">
                      </div>
                      <!--end image-->

                      <!-- Title-->
                      <div class="col-md-5 col-5">
                        <h5><?php echo $title; ?> </h5>
                        <p> Số chỗ:<?php echo $size; ?></p>
                      </div>
                      <!--end title-->

                      <!--qunatity-->
                      <div class="col-md-2 col-1">
                        <h5>x <?php echo $db_pro_qty; ?></h5>
                      </div>
                      <!--end qty-->
                      <!--price-->
                      <div class="col-md-2 col-2">
                        <h5>
                          <?php echo $single_pro_total_price; ?>
                        </h5>
                      </div>
                      <!--end price-->

                    </div>
                    <hr>

            <?php

                  }
                }
              }
            }
            ?>


          </tbody>

        </table>
        <!--end cart-->


        <div class="row">
          <div class="col-md-6 col-sm-6 col-6">
            <h6>Giá </h6>
            <h5 class="font-weight-bold">Tổng cộng</h5>

          </div>
          <div class="col-md-6 col-sm-6 col-6">
            <h6 class="text-right font-weight-normal">VNĐ <?php echo $sub_total; ?></h6>
            
            <h5 class="text-right font-weight-bold">VNĐ <?php echo $total; ?></h5>
          </div>
        </div>

      </div>
      <!--end order--->
    </div>

  <?php
  }
  ?>

</div>

<?php include('include/footer.php'); ?>