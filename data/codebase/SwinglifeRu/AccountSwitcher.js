/**
 * Created by alexradyuk on 7/2/19.
 */


var Accounts = [
    {
        username: 'annamargarita',
        password: 'forgiving202'
    },
    {
        username: 'juan_i_maria',
        password: 'forgiving202'
    },
    {
        username: 'paraanal',
        password: 'forgiving202'
    },
];

var AccountSwitcher = {
    run: function () {
        var username = localStorage.getItem('SW_Accounts_username');
        var password = localStorage.getItem('SW_Accounts_password');
        if(username && password){
            if(!this.check()) {
                localStorage.removeItem('SW_Accounts_username');
                localStorage.removeItem('SW_Accounts_password');
                this.login(username, password);
            }
        }
    },
    switch: function (username, password) {
        if(this.check()){
            this.remember(username, password);
            this.logout();
        }else {
            this.login(username, password);
        }
    },
    check: function () {
        //return 1 if user is logged in & 0 if no
        return $('.b-header__user-area').size();
    },
    logout: function () {
        document.location.href = 'https://www.swinglife.ru/exit';
    },
    login: function (username, password) {
        var $ = window.$;
        $('._login').click();

        TheApp.waitFor('#edit-name', function ($elem) {
           $elem.val(username);

           $('#edit-pass').val(password);

           $('#edit-submit').click();
        });
    },
    remember: function (username, password) {
        localStorage.setItem('SW_Accounts_username', username);
        localStorage.setItem('SW_Accounts_password', password);
    }
};

for(var i = 0; i < Accounts.length; i++){
    var item = Accounts[i];

    $content.append(("<div class='TheApp_account'><a href='#' data-username='%username%' data-password='%password%'>%username%</a></div>")
        .replace(/%username%/g, item.username)
        .replace('%password%', item.password))
    ;
}

if(AccountSwitcher.check()) {
    $content.append('<div style="height: 1px; background: #888"></div>');
    $content.append('<div class="TheApp_logout"><a href="/exit">Logout</a></div>');
}

$content.find('.TheApp_account a').click(function (e) {
    e.stopPropagation();
   AccountSwitcher.switch($(this).data('username'), $(this).data('password'));
   return false;
});


AccountSwitcher.run();