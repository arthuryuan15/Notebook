```j a
/**
 * webtrees: online genealogy
 * Copyright (C) 2021 webtrees development team
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */
```

#webTrees-hanging_line_report

https://www.upwork.com/jobs/~01bf3c0a791b9646b3

## 1 JD on upwork

It would be best if you can speak Chinese.

I need to develop a webtrees reporting module, , which can be exported to PDF and SVG formats using the family tree hanging style，It is convenient for me to deliver it directly to the printing plant.

1. webtrees source code and its introduction：

https://github.com/fisharebest/webtrees

1. Module examples and development instructions:

https://github.com/fisharebest/webtrees/tree/master/modules_v4

1. Examples of existing reporting modules:

https://dev.webtrees.net/demo-dev/tree/demo

（Click menu—report） If you have any questions or difficulties, please feel free to communicate with me..

I hope you are proficient in laravel, tcpdf.

  [Link to file in another dir on a different drive](/Users/yuanjinshuai/Documents/NoteBookforLearn/Notebook/upwork/1.md)

 [1.md](1.md) 





https://webtrees.net/download/modules 这个里面有其他开发者开发的插件

https://webtreesmanual.com/ 这是其他志愿者写的使用手册

1. to know how the whole things to work
2. to know where to put the new things
3. how to put the new things
4. Develop a webtrees reporting module to generate genealogy hanging line styles according to the attached <Hanging Line Genealogy Style.pdf> and <Sample biographies by line.pdf> styles and export to PDF

开发一个webtrees报告模块，按照附件中的<吊线式家谱样式.pdf>和<行传示例图.pdf>的样式生成家谱吊线式体例并可导出为PDF

1. Please follow the solutions in <Approach to some problems in development.docx> during the development process.

在开发过程中请遵循<开发中一些问题的处理方法.docx>中的解决方案。

3.Code to be concise, efficient operation, priority calls to official functions, to consider this module to deal with more than 100,000 data and the generation of PDF files may be more than 100MB in the case of processing

代码要简洁，运行高效，优先调用官方函数，要考虑此模块处理超过十万条数据及生成的PDF文件有可能在100MB以上情况下的处理方式。

------



## 1 项目概述

​	开发一个webtrees报告插件/模块，按照附件中的示例生成家谱吊线式体例并可导出为PDF格式。

​		1、 要求生成的PDF可以正常显示中文，并要考虑生成的文件有可能在100MB以上的处理方式。

​		2、 使用吊线式进行排版，吊线式样式见附件《Hanging Line Genealogy Style吊线式家谱样式.pdf》

​		3、 所具有的选项: 其中（4）、（5）、（6）、（8）、（9）功能代码官方已有，仅需调用即可。

​	见附件中最终效果图

​	（1）每卷页数：当页数很多时，可以设定最大页码并分卷，每卷页码从1开始。

​	（2）显示全谱：勾选后在下方显示所有没有父亲的男性并指定其是第几世（可考虑将数据存为json文件，方便下次直接读取，避免重复录入）。

​	（4）显示行传 (已有类似代码）:以表格形式，将每个人所有信息都显示全，示例见附件**行传示例图**。

​	（5）选择亲戚（已有类似代码，需略作修改）：直系祖先，直系祖先和他们的家庭，全部

​		其中:

​				**直系祖先：**显示这个人的所有后代和直系祖先（不显示直系祖先的兄弟姐妹）

​				**直系祖先和他们的家庭：**显示这个人所有后代和直系祖先的家庭（包含直系祖先的所有兄弟姐妹，不含直系祖先的兄弟姐妹的后代）

​				**全部：**显示这个人所有后代和直系祖先、直系祖先的兄弟姐妹及直系祖先的兄弟姐妹的后代

​	（6）是否显示（已有类似代码）：照片、出生日期、去世日期、居住地、身份、工作岗位，配偶信息，结婚日期。

​	（7）自定义文本内容：页眉，页脚，页边

​	（8）页面大小（已有类似代码）：A4\A3等

​	（9）使用颜色（男女姓名颜色不同）



## 3  前端最终效果

见附件<Front-end page design effects前端页面设计效果图.jpg>

![Front-end page design effects前端页面设计效果图](https://tva1.sinaimg.cn/large/008vOhrAgy1hiwsn81arej30u00yetbl.jpg)



```
title:
	Hanging line reports
	吊线式报告
  
description:
	'Chinese hanging line family tree.' => '中国吊线式家谱。',
```





## 4  项目背景

1、     webtrees源代码及其介绍：https://github.com/fisharebest/webtrees

2、模块示例和开发说明: https://github.com/fisharebest/webtrees/tree/master/modules_v4

3、现有报告模块示例: https://dev.webtrees.net/demo-dev/tree/demo （点击菜单栏-报告）

<img src="https://tva1.sinaimg.cn/large/008vOhrAgy1hiwsnn002zj313l0u0jwa.jpg" alt="image-20210707123454783" style="zoom:33%;" />



4、现有报告模块所涉及的主要代码:

​	https://github.com/fisharebest/webtrees/tree/master/app/Module (每个含有Report字符的文件都是一个独立模块）

​	xml文件：https://github.com/fisharebest/webtrees/tree/master/resources/xml/reports

​	(每个xml文件都是一个独立模块)

 

报告代码:

https://github.com/fisharebest/webtrees/tree/master/app/Report

 



## 报告

3. / 分隔目录和子目录 %2F

http://localhost:8000/index.php?route=/tree/tree1

<img src="https://tva1.sinaimg.cn/large/008vOhrAgy1hiwsnplxttj30zm0lc770.jpg" alt="image-20210708192646336" style="zoom:33%;" />







Tech Design

delete config `data/config.ini.php`

official website: https://webtrees.net/

1. run the installation

   ```shell
   php -S 127.0.0.1:8000
   ```

or using debug to run the application

![image-20210708184727406](https://tva1.sinaimg.cn/large/008vOhrAgy1hiwsn9tmv9j314k0u00wg.jpg)







```
app(ModuleService::class)->findByComponent(ModuleMenuInterface::class, $tree, Auth::user())
```







开发周期

前端：构造页面+请求 + 熟悉php语法 2天 -》周六



### 5 前端开发

#### 1 genealogy menu

<img src="https://tva1.sinaimg.cn/large/008vOhrAgy1hiwsnqywvcj30uu0nedib.jpg" alt="image-20210710122140285" style="zoom:33%;" />

![image-20210710122108582](https://tva1.sinaimg.cn/large/008vOhrAgy1hiwsnbkksnj31bq0cc40h.jpg)

#### 2 genealogy submenu

<img src="/Users/yuanjinshuai/Library/Application Support/typora-user-images/image-20210710122610682.png" alt="image-20210710122610682" style="zoom:33%;" />

`menu-item.phtml`

![image-20210710122728848](https://tva1.sinaimg.cn/large/008vOhrAgy1hiwsnchliwj31h10u0dkr.jpg)



**get subtree from DB**

![image-20210710230138306](https://tva1.sinaimg.cn/large/008vOhrAgy1hiwsneehj4j31fw0ne0ww.jpg)

![image-20210710230312229](https://tva1.sinaimg.cn/large/008vOhrAgy1hiwsngu9r2j30y80sewif.jpg)



add `hanging_line_report`

```mysql
select * from wt_module where module_name like '%_report';
```

```mysql
INSERT INTO wt_module VALUES('hanging_line_report', 'enabled', NULL, NULL, NULL, NULL);
```

```mysql
update wt_module set status = "disabled" where module_name like '%_report';
```

```mysql
CREATE TABLE `module` (
  `module_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'enabled',
  `tab_order` int DEFAULT NULL,
  `menu_order` int DEFAULT NULL,
  `sidebar_order` int DEFAULT NULL,
  `footer_order` int DEFAULT NULL,
  PRIMARY KEY (`module_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci
```





#### 3 $menu

```php
/**
 * System for generating menus.
 */
class Menu
{
    /** @var string The text to be displayed in the menu */
    private $label;

    /** @var string The target URL or href */
    private $link;

    /** @var string The CSS class used to style this menu item */
    private $class;

    /** @var string[] A list of optional HTML attributes, such as onclick or data-xxx */
    private $attrs;

    /** @var Menu[] An optional list of sub-menus. */
    private $submenus;

    /**
     * Constructor for the menu class
     *
     * @param string   $label    The label for the menu item
     * @param string   $link     The target URL
     * @param string   $class    A CSS class
     * @param string[] $attrs    Optional attributes, such as onclick or data-xxx
     * @param Menu[]   $submenus Any submenus
     */
    public function __construct(
        string $label,
        string $link = '#',
        string $class = '',
        array $attrs = [],
        array $submenus = []
    ) {
        $this
            ->setLabel($label)
            ->setLink($link)
            ->setClass($class)
            ->setAttrs($attrs)
            ->setSubmenus($submenus);
    }
```

#### 4 $tree

```
public function genealogyMenu(?Tree $tree)
```

```php
Fisharebest\Webtrees\Tree::__set_state(array(
   'id' => 1,
   'name' => 'yuan',
   'title' => '我的家谱',
   'fact_privacy' => 
  array (
    'REPO' => 1,
    'SOUR' => 1,
    'SSN' => 0,
    'SUBM' => 0,
    'SUBN' => 0,
  ),
   'individual_privacy' => 
  array (
  ),
   'individual_fact_privacy' => 
  array (
  ),
   'preferences' => 
  array (
    'CONTACT_USER_ID' => '1',
    'gedcom_filename' => 'test.ged',
    'imported' => '1',
    'keep_media' => '0',
    'LANGUAGE' => 'zh-Hans',
    'REQUIRE_AUTHENTICATION' => '',
    'title' => '我的家谱',
    'WEBMASTER_USER_ID' => '1',
  ),
   'user_preferences' => 
  array (
  ),
))
```

<img src="/Users/yuanjinshuai/Library/Application Support/typora-user-images/image-20210710224956016.png" alt="image-20210710224956016" style="zoom:50%;" />









<img src="https://tva1.sinaimg.cn/large/008vOhrAgy1hiwsnsllspj311e0u0n2c.jpg" alt="image-20210710131811610" style="zoom:50%;" />



```
label = 'Ancestors'
link = 'http://localhost:8888/index.php?route=%2Ftree%2Fyuan%2Freport%2Fahnentafel_report&xref=I32312'
class = 'menu-report-ahnentafel_report'
```



```php
            $module_info = DB::table('module') // Basic Usage of the DB Facade, query builder for 'module'
                ->get() // Gets all results for the built query
                ->mapWithKeys(static function (stdClass $row): array {
                    return [$row->module_name => $row];
                });
```





```php
map(function (ModuleInterface $module) use ($module_info){

	$module_info
}
```



```php
map(function ($item, $key) {
	printf($item);
	printf($key);
  return $item * 2;
});
```





## 后端

route: /tree/tree1/report/hanging_line_report

```php
// get hanging line setup page 
1 $router->get(ReportSetupPage::class, '/report/{report}');
2 $router->post(ReportSetupAction::class, '/report/{report}');
```

route: /tree/tree1/report-run/hanging_line_report

```php
3 $router->get(ReportGenerate::class, '/report-run/{report}');
```





```php
$report = new ReportParserSetup($xml); // $xml to html ReportParserGenerate()
self::assertIsArray($report->reportProperties());

ob_start(); 
new ReportParserGenerate($xml, new HtmlRenderer(), $vars, $tree, $data_filesystem);
$html = ob_get_clean();
self::assertStringStartsWith('<', $html);
self::assertStringEndsWith('>', $html);

ob_start();
new ReportParserGenerate($xml, new PdfRenderer(), $vars, $tree, $data_filesystem);
$pdf = ob_get_clean();
```



## 排期



生成家谱吊线式的页面 1天 -》 周日

查看pdf，2天-〉周一、周二

优化pdf，2天-〉周三、周四





![image-20210714110439175](https://tva1.sinaimg.cn/large/008vOhrAgy1hiwsni0bgwj30gg07i750.jpg)

![image-20210714110653853](https://tva1.sinaimg.cn/large/008vOhrAgy1hiwsnjf7yfj30fo0himyn.jpg)

![image-20210714110932190](https://tva1.sinaimg.cn/large/008vOhrAgy1hiwsnkumrlj30n60ua413.jpg)

```html
<List list="individual" filter1="BIRT:PLAC CONTAINS $birthplace" filter2="BIRT:DATE GTE $birthdate1" filter3="BIRT:DATE LTE $birthdate2" filter4="NAME CONTAINS $name" sortby="$sortby">
```

