<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Rail 'n' Roll</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/main.css">
  <script src="js/scroll.js"></script>
  <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
</head>



<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar" style="background-color:#900;">
        <span class="icon-bar" style="background-color:#fff;"></span>
        <span class="icon-bar" style="background-color:#fff;"></span>
        <span class="icon-bar" style="background-color:#fff;"></span> 
      </button>
      <a class="navbar-brand" href="#myPage"><img src="images/logo.png" class="img-responsive" alt="Logo" width="60" height="60" style="margin-top:-10px;"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#about">ABOUT</a></li>
        <li><a href="#services">SERVICES</a></li>
        <li><a href="#register" data-toggle="modal">REGISTER</a></li>
      </ul>
    </div>
  </div>
</nav>


<div class="jumbotron" style="margin-bottom:50px; margin-top:40px; background-image:url(images/cover.jpeg); background-repeat:no-repeat; color: #ffffff; height:400px; padding: 100px 25px; font-family: Montserrat, sans-serif;"> 
	<div class="container" align="center" style="margin-top:-20px;">
  	<h1>Rail 'n' Roll</h1> 
  	<p>We specialize in Railway bookings</p>
  	</div>
  <div class="container" style="background-color:#900; width:300px; padding-bottom:10px; border-radius:10px; margin-top:5px;">
  <h2>Sign in</h2>
 
  <form role="form" method="post" action="userController?id=login">
    <div class="form-group">
      <label for="userid">User ID:</label>
      <input type="text" class="form-control" id="userid" name="userid" placeholder="Enter username">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Enter password">
    </div>
    <button type="submit" class="btn btn-default">Login</button>
    <div class="links" style="float:right;">
    
    <a href="#register" style="text-decoration:none; color:#fff; font-size:12px;" data-toggle="modal">Sign Up</a>
    </div>
  </form>
</div>
</div>


<div id="about" class="container-fluid" style="margin-top:80px;">
  <div class="row">
  <div class="col-sm-1">
  </div>
    <div class="col-sm-7">
      <h2>About Rail 'n' Roll</h2> 
      <p>Nurtured from the seed of a single great idea - to empower the traveller - Rail 'n' Roll went on to pioneer the entire online travel industry in India. It has revolutionised the travel industry over the years. This is the story of Rail 'n' Roll, India’s Online Travel Leader.<br/>
Railnroll.tk, India’s leading online travel company was founded in the year 2016 by Ishita Choudhary. Created to empower the Indian traveller with instant booking and comprehensive choices, the company began its journey in the Indian travel market. It aimed to offer a range of best-value products and services along with cutting-edge technology and dedicated round-the-clock customer support.</p>
    </div>
    <div class="col-sm-4">
      <img src="images/train.jpg" class="img-responsive" alt="About" style="margin:20px auto 0px auto;"> 
    </div>
  </div>
</div>

<div class="container-fluid bg-grey">
  <div class="row">
    <div class="col-sm-4">
      <img src="images/Globe.png" class="img-responsive" alt="Values" style="margin:40px auto 0px auto;"> 
    </div>
    <div class="col-sm-7">
      <h2>Our Values</h2>
      <h4><strong>MISSION:</strong> Our mission is to strive for excellence in whatever we do. Focus on continuous improvement in interactions with people, efficiency of processes, and the wellbeing of the organization. <br/> We must ensure consistency between our words and actions, always delivering what we commit. We can thereby maintain transparency, trust and accountability.</h4> 
      <p><strong>VISION:</strong> We must maintain focus on our customers, both internal & external, by giving them priority. Strive to exceed their expectations in terms of the value and quality delivered. <br/> We must foster an environment wherein we can efficiently utilise the abilities of all team members to achieve goals. We should work on the premise that the whole is greater than the sum of the parts.</p>
    </div>
    <div class="col-sm-1">
    </div>
  </div>
</div>






<div id="services" class="container-fluid text-center">
  <h2>SERVICES</h2>
  <h4>What we offer</h4>
  <br>
  <div class="row slideanim">
    <div class="col-sm-4">
      <img src="images/power.jpg" class="img-circle" alt="Power" width="60" height="60">
      <h4>POWER</h4>
      <p>Super power to book your journey instantly</p>
    </div>
    <div class="col-sm-4">
      <img src="images/ease.jpg" class="img-circle" alt="Ease" width="65" height="65" style="margin-top:-10px;">
      <h4>EASE</h4>
      <p>Easy access with no huslte bustle</p>
    </div>
    <div class="col-sm-4">
      <img src="images/jobdone.png" class="img-rounded" alt="Job Done" width="50" height="50">
      <h4>JOB DONE</h4>
      <p>Assurance for completion of Job</p>
    </div>
  </div>
  <br><br>
  <div class="row slideanim">
    <div class="col-sm-4">
      <img src="images/green.png" class="img-rounded" alt="Green" width="60" height="60">
      <h4>GREEN</h4>
      <p>Go green with E-Tickets</p>
    </div>
    <div class="col-sm-4">
      <img src="images/certified.jpg" class="img-circle" alt="Certified" width="60" height="60" style="margin-top:-5px;">
      <h4>CERTIFIED</h4>
      <p>Certification and approval or IRCTC</p>
    </div>
    <div class="col-sm-4">
      <img src="images/hardwork.png" class="img-rounded" alt="Hard Work" width="50" height="50">
      <h4>HARD WORK</h4>
      <p>We work Hard to ease your work</p>
    </div>
  </div>
</div>


<footer class="container-fluid text-center bg-grey">
  <a href="#myPage" title="To Top">
    <img src="images/up.png" class="img-rounded" alt="Up" width="30" height="18">
  </a>
  <p>Rail 'n' Roll Railway Reservation System Made By Ishita Choudhary</p> 
</footer>




<div class="modal fade" id="register" role="dialog" style="margin-top:60px; margin-bottom:10px;">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="height:80px; text-align:center;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 style="color:#900;">Register</h4>
        </div>
        <div class="modal-body">
          <form role="form" method="post" action="userController?id=register">
        <div class="row">
        <div class="col-sm-6">
        <div class="form-group">
              <label for="username">Username</label><span class="mandatory" id="star">*</span>
              <input type="text" class="form-control" id="username" name="username" placeholder="Enter username">
            </div>
            </div>
            <div class="col-sm-6">
            <div class="form-group">
              <label for="password">Password</label><span class="mandatory" id="star">*</span>
              <input type="password" class="form-control" id="password" name="password" placeholder="Enter password">
            </div>
            </div>
            </div>
            <table class="table">
    <tbody>
      <tr>
        <td>
      <div class="row">
        <div class="col-sm-6">
        <div class="form-group">
              <label for="security">Security Question</label><span class="mandatory" id="star">*</span>
				<select class="form-control" id="security" name="security"><option>--Select One--</option><option>What is your Home Town</option><option>What is your Pets Name</option><option>What is your Vehicle Registration Number</option><option>What was the name of your First School</option><option>What was your First Vehicle Make</option></select>
            </div>
            </div>
            <div class="col-sm-6">
     			<label for="answer">Your Answer</label><span class="mandatory" id="star">*</span>
              <input type="text" class="form-control" id="answer" name="answer" placeholder="Enter Answer">
            </div>
            </div>
            
       <div class="row">
        <div class="col-sm-6">
        <div class="form-group">
              <label for="firstname">Firstname</label><span class="mandatory" id="star">*</span>
              <input type="text" class="form-control" id="firstname" name="firstname" placeholder="Enter firstname">
            </div>
            </div>
            <div class="col-sm-6">
            <div class="form-group">
              <label for="lastname">Lastname</label><span class="mandatory" id="star">*</span>
              <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Enter lastname">
            </div>
            </div>
            </div>     
            
            
            
        <div class="row">
        <div class="col-sm-6">
        <div class="form-group">
              <label for="gender">Gender</label><span class="mandatory" id="star">*</span>
              <select class="form-control" id="gender" name="gender"><option>Male</option><option>Female</option></select>
            </div>
            </div>
            <div class="col-sm-6">
            <div class="form-group">
              <label for="marital">Marital Status</label><span class="mandatory" id="star">*</span>
              <select class="form-control" id="marital" name="marital"><option>Married</option><option>Unmarried</option></select>
            </div>
            </div>
            </div> 
            
            
            <div class="row">
        <div class="col-sm-6">
        <div class="form-group">
        <label for="bday">Date of Birth</label><span class="mandatory" id="star">*</span>
                <input type="date" class="form-control" name="date" max="2015-12-31" min="1900-01-01"/> 
                 </div>
            </div>     
            
            <div class="col-sm-6">
        <div class="form-group">
        <label for="occupation">Occupation</label><span class="mandatory" id="star">*</span>
        <select class="form-control" id="occupation" name="occupation"><option>--Select One--</option><option>Government</option><option>Public</option><option>Private</option><option>Professional</option><option>Self Employed</option><option>Student</option><option>Other</option></select>
        </div>
        </div>
        </div>
     
     <div class="row">
     <div class="col-sm-4">
     <div class="form-group">
     <label for="email">Email ID</label><span class="mandatory" id="star">*</span>
<input type="email" class="form-control" id="email" name="email"/>
</div>
</div>

<div class="col-sm-4">
<div class="form-group">
<label for="mobile">Mobile</label><span class="mandatory" id="star">*</span>
<span role="alert" class="mobile">+91</span><input type="tel" class="form-control" name="mobile" id="mobile"/>
</div>
</div>

<div class="col-sm-4">
<div class="form-group">
<label for="nationality">Nationality</label><span class="mandatory" id="star">*</span>
<select id="nationality" class="form-control" name="nationality"><option>--Select One--</option><option>India</option><option>Afghanistan</option>
        <option>Albania</option>
        <option>Algeria</option>
        <option>American Samoa</option>
        <option>Andorra</option>
        <option>Angola</option>
        <option>Anguilla</option>
        <option>Antarctica</option>
        <option>Antigua and Barbuda</option>
        <option>Argentina</option>
        <option>Armenia</option>
        <option>Aruba</option>
        <option>Australia</option>
        <option>Austria</option>
        <option>Azerbaijan</option>
        <option>Bahamas</option>
        <option>Bahrain</option>
        <option>Bangladesh</option>
        <option>Barbados</option>
        <option>Cameroon</option>
        <option>Canada</option>
        <option>Cape Verde</option>
        <option>Cayman Islands</option>
        <option>Dominican Republic</option>
        <option>Ecuador</option>
        <option>Egypt</option>
        <option>El Salvador</option>
        <option>Equatorial Guinea</option>
        <option>France</option>
        <option>French Guiana</option>
        <option>French Polynesia</option>
        <option>French Southern Territories</option>
        <option>Germany</option>
        <option>Ghana</option>
        <option>Gibraltar</option>
        <option>Greece</option>
        <option>Haiti</option>
        <option>Hong Kong</option>
        <option>Hungary</option>
        <option>Iceland</option>
        <option>Indonesia</option>
        <option>Japan</option>
        <option>Jersey</option>
        <option>Jordan</option>
        <option>Kazakhstan</option>
        <option>Kenya</option>
        <option>Kuwait</option>
        <option>Myanmar</option>
        <option>Nepal</option>
        <option>Nigeria</option>
        <option>Pakistan</option>
        <option>Philippines</option>
        <option>Poland</option>
        <option>Portugal</option>
        <option>Saudi Arabia</option>
        <option>Taiwan</option>
        <option>Zimbabwe</option>
        <option>Not Listed</option></select>
</div>
</div>
</div>
</td>
</tr>
<tr>
<td>
<div class="form-group">
<label for="address">Address</label><span class="mandatory" id="star">*</span>
<input type="text" class="form-control" id="address" name="address"/>
</div>

<div class="row">
<div class="col-sm-6">
<div class="form-group">
<label for="country">Country</label><span class="mandatory" id="star">*</span>
<select id="country" class="form-control" name="country"><option>--Select One--</option><option>India</option><option>Afghanistan</option>
        <option>Albania</option>
        <option>Algeria</option>
        <option>American Samoa</option>
        <option>Andorra</option>
        <option>Angola</option>
        <option>Anguilla</option>
        <option>Antarctica</option>
        <option>Antigua and Barbuda</option>
        <option>Argentina</option>
        <option>Armenia</option>
        <option>Aruba</option>
        <option>Australia</option>
        <option>Austria</option>
        <option>Azerbaijan</option>
        <option>Bahamas</option>
        <option>Bahrain</option>
        <option>Bangladesh</option>
        <option>Barbados</option>
        <option>Cameroon</option>
        <option>Canada</option>
        <option>Cape Verde</option>
        <option>Cayman Islands</option>
        <option>Dominican Republic</option>
        <option>Ecuador</option>
        <option>Egypt</option>
        <option>El Salvador</option>
        <option>Equatorial Guinea</option>
        <option>France</option>
        <option>French Guiana</option>
        <option>French Polynesia</option>
        <option>French Southern Territories</option>
        <option>Germany</option>
        <option>Ghana</option>
        <option>Gibraltar</option>
        <option>Greece</option>
        <option>Haiti</option>
        <option>Hong Kong</option>
        <option>Hungary</option>
        <option>Iceland</option>
        <option>Indonesia</option>
        <option>Japan</option>
        <option>Jersey</option>
        <option>Jordan</option>
        <option>Kazakhstan</option>
        <option>Kenya</option>
        <option>Kuwait</option>
        <option>Myanmar</option>
        <option>Nepal</option>
        <option>Nigeria</option>
        <option>Pakistan</option>
        <option>Philippines</option>
        <option>Poland</option>
        <option>Portugal</option>
        <option>Saudi Arabia</option>
        <option>Taiwan</option>
        <option>Zimbabwe</option>
        <option>Not Listed</option></select>
           </div>
           </div>
           
           <div class="col-sm-6">
           <div class="form-group">
           <label for="state">State</label><span class="mandatory" id="star">*</span>
			<input type="text" class="form-control" id="state" name="state"/>
           </div>
           </div>
           </div>
           
           <div class="row">
           <div class="col-sm-6">
           <div class="form-group">
           <label for="city">City</label><span class="mandatory" id="star">*</span>
			<input type="text" class="form-control" id="city" name="city"/>
           </div>
           </div>
           
           <div class="col-sm-6">
           <div class="form-group">
           <label for="pin">Pin/Zip</label><span class="mandatory" id="star">*</span>
			<input type="text" class="form-control" id="pin" name="pin"/>
           </div>
           </div>
           </div>
           </td>
           </tr>
           
           <tr>
           <td>
           <div class="row">
           <div class="col-sm-6">
           <button type="submit" class="btn btn-default btn-success btn-block">Register</button>
           </div>
           <div class="col-sm-6">
           <button type="reset" class="btn btn-default btn-danger btn-block">Reset</button>
           </div>
           </div>
           </td>
           </tr>
    </tbody>
  </table>
          </form>
        </div>
     </div>
  </div>
</div>
        






</body>
</html>
