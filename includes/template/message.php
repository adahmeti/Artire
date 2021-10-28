<?php 
session_start();
include('include/config.php');






?>
<div class="sidebar-contact">
    <div class="toggle"></div>
    <h3>CONTACT WITH US </h3>
    <h4>We`d love to hear your ideas!</h4>
    <div class="scroll>
    <form action="index.php" method="POST">
<label>Bussines name <?php echo $user?></label>
<select  class="btn1" name="bussinss"  required>
<option class='btn-op' value="">Select Bussiness </option> 
<?php $query=mysqli_query($con,"select * from sellers");
while($row=mysqli_fetch_array($query))
{?>

<option value="<?php echo $row['id'];?>"><?php echo $row['bussines_name'];?></option>
<?php } ?>
</select>  
    <input type="text" name="subjekti" placeholder="Subjekti">
      <textarea name='mesazhi'placeholder="Message Here.."></textarea>
      <input type="submit" name="sent" value="Sent">
    </form>
    </div>
  </div>