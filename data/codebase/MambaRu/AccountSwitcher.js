/**
 * Created by alexradyuk on 7/2/19.
 */


var Accounts = [
    {
        name: 'Артем',
        username: 'alex.r@gms.info',
        password: '7wXyBB7H'
    },
    {
        name: 'Николь',
        username: 'n4dya.volkova@yandex.ru',
        password: 'Kdjm7Bpq'
    }
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
        return $('.b-profile').size();
    },
    logout: function () {
        document.location.href = 'https://www.swinglife.ru/exit';
    },
    login: function (username, password) {
        var $loginButton = null;
        $('header a').each(function () {
            if($(this).data('name') == 'login-action'){
                $loginButton = $(this);
            }
        });

        $loginButton.find('span').click();

        TheApp.wait(function () {
            if($('form[data-name=loginForm]').size()){
               return $('form[data-name=loginForm]');
            }
            return null;
        }, function ($loginForm) {
            var $ipLogin = $loginForm.find('input[name=login]');
            var $ipPassword = $loginForm.find('input[name=password]');
            setTimeout(function(){
                $ipLogin.focus();
                setTimeout(function () {
                    $ipLogin.val(username);
                    setTimeout(function () {
                        $ipLogin.change();
                        $(document).mousemove();
                        setTimeout(function () {
                            $ipLogin.blur();
                            // alert($._data($ipLogin.get(0), 'events'));
                            setTimeout(function () {
                                $ipPassword.focus();
                 //              $loginForm.find('input[type=submit]').click();
                            });
                        }, 500);
                    }, 500);
                }, 500);
            }, 500);
        });
        return;

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

    $content.append(("<div class='TheApp_account'><a href='#' data-username='%username%' data-password='%password%'>%name%</a></div>")
        .replace('%name%', item.name)
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