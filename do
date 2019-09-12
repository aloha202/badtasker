<?php

    chdir(dirname(__FILE__));

    $commands = array(
        'help' => '', 
        'ac' => '', 
        'acc' => '', 
        'rebuild' => '', 
        'postconfigure' => ''
    );
    if(!empty($argv[1])){
        switch($argv[1]){
            case 'help':
                foreach($commands as $name => $descr){
                    echo "$name\t\t$descr\n";
                }
                break;
            case 'ac':
                echo shell_exec('php symfony assets:cache-create frontend');
                break;
            case 'acc':
                echo shell_exec('php symfony assets:cache-delete frontend');
                break;
            case 'build':
                echo shell_exec('php symfony doctrine:build --all --no-confirmation');
                echo shell_exec('php symfony db:load');
                echo shell_exec('php symfony cc');
                echo shell_exec('php symfony cms:user-password');                 
                break;
            case 'rebuild':
                echo shell_exec('php symfony db:dump');
                echo shell_exec('php symfony doctrine:build --all --no-confirmation');
                echo shell_exec('php symfony db:load');                
                echo shell_exec('php symfony cc');
                echo shell_exec('php symfony cms:user-password');                 
                break;
            case 'postconfigure':
                if(empty($argv[2])){
                        die("Please specify database name, second argument");
                }
                $directories = array(
                        'cache', 'log', 'web/uploads', 'web/cache'
                );

                foreach($directories as $d){
                        shell_exec("mkdir $d");	
                        shell_exec("chmod 0777 $d");
                        echo "directory $d created\n";
                }


                $symfony = "<?php require_once '/var/www/lib/symfony/lib/autoload/sfCoreAutoload.class.php';";
                file_put_contents('config/symfony.php', $symfony);
                echo "File config/symfony.php created\n";

                $database = "all:
doctrine:
  class: sfDoctrineDatabase
  param:
    dsn: 'mysql:host=localhost;dbname=%db%'
    username: root
    password: radamelfalcao";	


                $database = strtr($database, array('%db%' => $argv[2]));

                file_put_contents('config/databases.yml', $database);
                echo "File config/databases.yml created\n";


                shell_exec("cp data/uploads.zip web/uploads/uploads.zip");
                shell_exec("unzip web/uploads/uploads.zip -d web/uploads");
                shell_exec("chmod -R 0777 web/uploads");
                shell_exec('rm web/uploads/uploads.zip');

                echo "Uploads processed\n";
                echo "Happy coding!\n\n";
                break;
        }
        
    }