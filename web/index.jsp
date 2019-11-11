<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    
<head>
    <link rel="stylesheet" type="text/css" href="css/base.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/fontawesome.min.css" />
    <link href="https://fonts.googleapis.com/css?family=Hind+Madurai&display=swap" rel="stylesheet">
    <title>Home</title>
</head>

<body>
    <div>
        <%@include file="WEB-INF/jspf/navbar.jspf"%>
    </div>
    <img src="img/bf.jpg" alt="Smiley face" style="width: 100%; height: auto;"></img>
    <div class="container">
        <p class="p">Os melhores produtos estão aqui</p>
        <div class="row img">
            <div class="col">
                <a href="#">
                    <img src="img/s1.PNG" alt="" height="380" width="232"></img>
                </a>
            </div>
            <div class="col">
                <a href="#">
                    <img src="img/s2.PNG" alt="" height="380" width="232"></img>
                </a>
            </div>
            <div class="col">
                <a href="#">
                    <img src="img/s3.PNG" alt="" height="380" width="232"></img>
                </a>
            </div>
            <div class="col">
                <a href="#">
                    <img src="img/s4.PNG" alt="" height="380" width="232"></img>
                </a>
            </div>
        </div>
        <div class="row img">
            <div class="col">
                <a href="#">
                    <img src="img/s5.PNG" alt="" height="380" width="232"></img>
                </a>
            </div>
            <div class="col">
                <a href="#">
                    <img src="img/s6.PNG" alt="" height="380" width="232"></img>
                </a>
            </div>
            <div class="col">
                <a href="#">
                    <img src="img/s7.PNG" alt="" height="380" width="232"></img>
                </a>
            </div>
            <div class="col">
                <a href="#">
                    <img src="img/s8.PNG" alt="" height="380" width="232"></img>
                </a>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
        </script>
    <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
</body>

</html>
