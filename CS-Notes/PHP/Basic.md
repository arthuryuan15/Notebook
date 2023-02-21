



## 1 install php

https://getgrav.org/blog/macos-bigsur-apache-multiple-php-versions

1. `brew install php`
2. `sudo cp /private/etc/php.ini.default /private/etc/php.ini`



**install apache -web**



**install PECL on mac os**

```shell
$ curl -O https://pear.php.net/go-pear.phar #install on a folder in root path, like /usr/lo/Cellar
$ sudo php -d detect_unicode=0 go-pear.phar
```

after that you will see below

```shell
Below is a suggested file layout for your new PEAR installation.  To
change individual locations, type the number in front of the
directory.  Type 'all' to change all of them or simply press Enter to
accept these locations.

 1. Installation base ($prefix)                   : /usr
 2. Temporary directory for processing            : /tmp/pear/install
 3. Temporary directory for downloads             : /tmp/pear/install
 4. Binaries directory                            : /usr/bin
 5. PHP code directory ($php_dir)                 : /usr/share/pear
 6. Documentation directory                       : /usr/docs
 7. Data directory                                : /usr/data
 8. User-modifiable configuration files directory : /usr/cfg
 9. Public Web Files directory                    : /usr/www
10. System manual pages directory                 : /usr/man
11. Tests directory                               : /usr/tests
12. Name of configuration file                    : /private/etc/pear.conf

1-12, 'all' or Enter to continue: 1
```

Enter 1，`/usr/local/pear`；
Enter 4，``/usr/local/bin`
Other, default, push enter.



**install xdebug**

`pecl install xdebug`

https://l1905.github.io/php/2020/02/28/macos-pecl-xdebug-mongodb/

https://jimfrenette.com/2018/12/xdebug-for-mac-os-x-php/

```
WARNING: configuration download directory "/tmp/pear/install" is not writeable.  Change download_dir config variable to a writeable dir to avoid this warning

cd /
cd /tmp/pear
sudo chmod -R 777 install/
```



```
#include "php.h"
         ^~~~~~~
1 error generated.
make: *** [xdebug.lo] Error 1
ERROR: `make' failed
```



after settting for php.ini you need to restart the php

`brew services restart php@7.4`







Use PHP’s built-in Web Server

```shell
php -S localhost:4000
```





how to run php on phpstorm



 composer install







`composer install`, which will import your packages and create the vendor folder, along with the autoload script.



CLI Interpreter：





PHPUnit settings are not configured.

### Download and install phpunit.phar manually﻿

- Download **phpunit.phar** from the [PHPUnit Official website](https://phpunit.de/getting-started/phpunit-9.html) and save it on your computer:
  - If you need full coding assistance in addition to the ability of running PHPUnit tests, store **phpunit.phar** under the root of the project where PHPUnit will be later used.
  - If you only need to run PHPUnit tests and you do not need any coding assistance, you can save **phpunit.phar** outside the project.

* phar

  The phar extension provides a way to put entire PHP applications into a single file called a "phar" (PHP Archive) for easy distribution and installation. 
  
  

**how to install php  extension in mac**



**change version of php**

from 7.3 to 7.4 

```shell
brew install php@7.4

brew link php@7.4

echo 'export PATH="/usr/local/opt/php@7.4/bin:$PATH"' >> ~/.bash_profile
echo 'export PATH="/usr/local/opt/php@7.4/sbin:$PATH"' >> ~/.bash_profile

source ~/.bash_profile
```



```shell
 ~  php -v                                                   ✔  21:33:57
PHP 7.4.20 (cli) (built: Jun  4 2021 03:27:28) ( NTS )
Copyright (c) The PHP Group
Zend Engine v3.4.0, Copyright (c) Zend Technologies
    with Zend OPcache v7.4.20, Copyright (c), by Zend Technologies
```



## Composer

---

1. `composer install` to create vendor

You don't need to git push `vendor` folder to the remote repostory, if you have `conposer.json`,  that's enough for everything,

so after you git clone the code, you need to run `composer install` to get `vendor` folder. 



```
  Problem 1
    - Root composer.json requires PHP extension ext-intl * but it is missing from your system. Install or enable PHP's intl extension.
  Problem 2
    - Root composer.json requires PHP extension ext-zip * but it is missing from your system. Install or enable PHP's zip extension.
  Problem 3
    - league/flysystem-ziparchive is locked to version 2.0.6 and an update of this package was not requested.
    - league/flysystem-ziparchive 2.0.6 requires ext-zip * -> it is missing from your system. Install or enable PHP's zip extension.

To enable extensions, verify that they are enabled in your .ini files:
    - /etc/php.ini
You can also run `php --ini` inside terminal to see which files are used by PHP in CLI mode.
```

2. `php artisan serve` or `php -S 127.0.0.1:8000`



## detal

vendor







## 2 language

`->` is used to call a method, or access a property, on the object of a class

```php
$webtrees = new Webtrees();
$webtrees->bootstrap();
```



- `->` is called to access a method of an instance (or a variable of an instanciated object)
- `::` is used to access static functions of an uninstanced object

```php
// Factory objects
Registry::cache(new CacheFactory());
Registry::familyFactory(new FamilyFactory());
Registry::filesystem(new FilesystemFactory());
```



 "`@`" will silence any php errors your function could raise.



`$this->`



```
DB::table
```



```php
ob_start();
// Do not use require, so we can catch errors for missing files
include $this->getFilenameForView($this->name);

return ob_get_clean();
```





**Larvel Collections**

items

rows



```php
DB::table('module')->get();
Illuminate\Support\Collection::__set_state(array(
   'items' => 
  array (
    0 =>  // this is row in table
    (object) array(
       'module_name' => 'ahnentafel_report',
       'status' => 'disabled',
       'tab_order' => NULL,
       'menu_order' => NULL,
       'sidebar_order' => NULL,
       'footer_order' => NULL,
    ),
    ....
```



```mysql
mysql> select * from wt_module;
+-------------------------+----------+-----------+------------+---------------+--------------+
| module_name             | status   | tab_order | menu_order | sidebar_order | footer_order |
+-------------------------+----------+-----------+------------+---------------+--------------+
| ahnentafel_report       | disabled |      NULL |       NULL |          NULL |         NULL |
| ancestors_chart         | enabled  |      NULL |       NULL |          NULL |         NULL |
| austrian-history        | enabled  |      NULL |       NULL |          NULL |         NULL |
| austrian-presidents     | enabled  |      NULL |       NULL |          NULL |         NULL |
| bdm_report              | disabled |      NULL |       NULL |          NULL |         NULL |
```



```php
DB::table('module')->get()->mapWithKeys(static function (stdClass $row): array {
                    return [$row->module_name => $row];
                });
Illuminate\Support\Collection::__set_state(array(
   'items' => 
  array (
    'ahnentafel_report' => 
    (object) array(
       'module_name' => 'ahnentafel_report',
       'status' => 'disabled',
       'tab_order' => NULL,
       'menu_order' => NULL,
       'sidebar_order' => NULL,
       'footer_order' => NULL,
    ),
```





**Container**

```php
class UserMailer
{
    protected $mailer;
    public function __construct(Mailer $mailer)
    {
        $this->mailer = $mailer;
    }

    public function welcome($user)
    {
        return $this->mailer->mail($user->email, 'Welcome!');
    }
}
```



UserMailer(mailer); // if need give the parameter and instance 

```php
$mailer = new MailgunMailer($mailgunKey, $mailgunSecret, $mailgunOptions); 
$userMailer = new UserMailer($mailer); // if needed, otherwise,  $userMailer = new UserMailer(); inject mailer all the time
```



```php
class UserMailer
{
    protected $mailer;
    public function __construct()
    {
        $this->mailer = new mailer();
    }

    public function welcome($user)
    {
        return $this->mailer->mail($user->email, 'Welcome!');
    }
}
```







## 3 debug

<img src="https://p.ipic.vip/s0907c.jpg" alt="image-20210709091334428" style="zoom:67%, width:200;" />





![image-20210709091449483](https://p.ipic.vip/mr9z14.jpg)

<img src="/Users/yuanjinshuai/Library/Application Support/typora-user-images/image-20210709091541436.png" alt="image-20210709091541436" style="zoom: 33%;" />





![image-20210709091720865](https://p.ipic.vip/8yvxqu.jpg)

<img src="/Users/yuanjinshuai/Library/Application Support/typora-user-images/image-20210709091804776.png" alt="image-20210709091804776" style="zoom:33%;" />







## mamp + xdebug

xdebug.location

` /usr/local/etc/php/7.4/conf.d/xdebug.ini`

### Mamp Configuration

![image-20210709204518947](https://p.ipic.vip/6zjo88.jpg)

Note: the document root is the path where index.php or server.php, the last level path of this.

![image-20210709204607154](https://p.ipic.vip/e4gvyv.jpg)

![image-20210709204822336](https://p.ipic.vip/698uml.jpg)

All you need to do in mamp is over, then save it

https://blog.csdn.net/u012852597/article/details/78358463

### Switch to phpstorm 

![image-20210709205011202](https://p.ipic.vip/qqej64.jpg)

<img src="/Users/yuanjinshuai/Library/Application Support/typora-user-images/image-20210709205021628.png" alt="image-20210709205021628" style="zoom:25%;" />





![image-20210709205153524](https://p.ipic.vip/f0lu0m.jpg)

Note: this is debug listening port

![image-20210709205308179](https://p.ipic.vip/czg3eq.jpg)



![image-20210709230947178](https://p.ipic.vip/dq4rmv.jpg)



![image-20210709235851126](https://p.ipic.vip/hfkp73.jpg)



start url must have php file what you want to start, if miss, return forbidden

<img src="/Users/yuanjinshuai/Library/Application Support/typora-user-images/image-20210710000000745.png" alt="image-20210710000000745" style="zoom:33%;" />

if there are not found, that means the root directory in mamp is not right, you need to change to the path of project. After change and save, click `webstart` button on mamp, annd you should see the next picture.

<img src="https://p.ipic.vip/57f2db.jpg" alt="image-20210710000148242" style="zoom:33%;" />



<img src="https://p.ipic.vip/6h9ucj.jpg" alt="image-20210710000626861" style="zoom:33%;" />

change the url to `http://localhost:8888/index.php`, you should see phpstorm catch the request if xdebug port is listening.



<img src="https://p.ipic.vip/y6banx.jpg" alt="image-20210710000758316" style="zoom:33%;" />

# How to Create phpinfo File and Check PHP Information

