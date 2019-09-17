<div id="fb-root"></div>

<script type='text/javascript'>

    $(function(){
        FB.init({
            appId      : '136369043084238',
            status     : true, 
            cookie     : true,
            xfbml      : true,
            oauth      : true
        });  
          FB.api('/me', function(user) {
            if (user) {
              for(var i in user.error){
                  alert(i + ' => ' + user.error[i]);
              }
    //          var image = document.getElementById('image');
    //          image.src = 'http://graph.facebook.com/' + user.id + '/picture';
              var name = document.getElementById('name');
              name.innerHTML = user.name
            }
          });        
    });
          

</script>

      <div class="fb-login-button" scope="email,user_checkins">
        Login with Facebook
      </div>

<div id='name'></div>