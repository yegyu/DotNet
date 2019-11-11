# DotNet
portfolio
### These was some of my job in the project
1. animaiton in the web-site
2. 개발 환경(development environment)
3. 프로젝트 중 건드려 본것 (Other things I done on project)

## example

 애니매이션의 시작 위치는 이 영어가 오른쪽 하단에서 보일 때입니다.(없는 것도 있습니다.) 
 At starting point is when this logo shows on right-bottom in the screen( animation ) but some don't<br><img src="https://www.windowsmode.com/wp-content/uploads/2019/01/Animotica-Official-Logo-e1547328051516.png" width="200px" height="200px"></img>
> 결제 (pay and check)

![Alt Text](https://github.com/yegyu/DotNet/blob/develop/gif/pay.gif)
***
<br>

> drag & drop

![Alt Text](https://github.com/yegyu/DotNet/blob/develop/gif/d&d.gif)
***
<br>

> 친구설문 피드보기(watch friend's recent survey and comment)

![Alt Text](https://github.com/yegyu/DotNet/blob/develop/gif/frSurFeed.gif)
***
<br>

> 무한스크롤(infinit scroll)

![Alt Text](https://github.com/yegyu/DotNet/blob/develop/gif/infinit.gif)
***
<br>

> 쪽지(send & receive mail and remove)

![Alt Text](https://github.com/yegyu/DotNet/blob/develop/gif/mail.gif)
***
<br>

> Q & A

![Alt Text](https://github.com/yegyu/DotNet/blob/develop/gif/q&a.gif)
***
<br>

> 친구 추가(request and add friend)

![Alt Text](https://github.com/yegyu/DotNet/blob/develop/gif/recomFr.gif)
***
<br>



## 개발 환경(languages, ide, dbms)
<img src="https://images.velog.io/post-images/lockstom/7229f590-7fc8-11e9-bc69-63b1b898b1df/Java%EC%82%AC%EC%A7%84.jpg" width="200px" height="200px"></img>
<img src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F99716D335A01A6381D" width="200px" heigth="200px"></img>
<img src="https://cdn.pixabay.com/photo/2017/08/05/11/16/logo-2582748_960_720.png" width="200px" heigth="200px"></img>
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Unofficial_JavaScript_logo_2.svg/1200px-Unofficial_JavaScript_logo_2.svg.png" width="200px" heigth="200px"></img>
<img src="https://poiemaweb.com/img/jquery-logo.png" width="200px" heigth="200px"></img>
<img src="http://www.focustraining.in/new/wp-content/uploads/2018/09/Oracle-SQL-logo.png" width="200px" heigth="200px"></img>
<img src="https://mblogthumb-phinf.pstatic.net/MjAxODAzMDRfNDIg/MDAxNTIwMTQ4ODYzNTI1.pafkG0llpCTnavxBCXoBl4stv5nDS3P-Xcj5CbZF9c8g.Eai6_HfOtmc45TPcoi4rZr0vQk0pu_LRvjigYShqu50g.PNG.feel940/image_1154452801520148641525.png?type=w800" width="200px" heigth="200px"></img>
<img src="http://www.bloter.net/wp-content/uploads/2016/08/eclipse_logo.jpg" width="200px" heigth="200px"></img>
<img src="https://www.viralpatel.net/app/uploads/2016/06/spring-mvc-4-hello-world.png" width="200px" heigth="200px"></img>
<img src="https://t1.daumcdn.net/cfile/tistory/999D624C5A4CCEA223" width="200px" heigth="200px"></img>

<

## 건드려 본 것(languages, ide, dbms, os)
* linux 
(lt basic)
* vim : 좋아함 
(gt basic)
* python : 크롤링 및 selenium 자동화 및 기본적인 데이터 분석(tensorflow, scikit-learn, numpy, pandas, matplotlib etc) 
(gt basic on crolling and data preprocessing)
* scala : 인터넷 보고 따라해봄
(lt basic)
* spark : 예제 따라 해
(beginner)
* hadoop and its ecosystem(sqoop, flume)
(beginner)
* shell script : 구구단 정도 해봄
(beginner)
* mysql on linux
(beginner)

<!DOCTYPE html>
<html>

<head>
<title>portfolio</title>
</head>

<body>

    <h1 align="center">DotNet 일부 영상</h1>
    
    <div id="main" style="text-align:center"></div>
    <script>
        const mp4s = ['pay.mp4','comment.mp4','dd.mp4',
        'mail.mp4','infinite.mp4','qa.mp4','frSurFeed.mp4','addFr.mp4']
        let getMain = document.getElementById('main')
        mp4s.forEach((el)=>
            getMain.innerHTML +=el.split(".")[0]+
                '<br>'+
                '<video width="800px" controls>'+
                    '<source src="https://github.com/yegyu/DotNet/blob/develop/dn_video/'+el+'" type="video/mp4">'+
                '</video><br><hr width="900px"><br>'
            
        );
    </script>
</body>

</html>

