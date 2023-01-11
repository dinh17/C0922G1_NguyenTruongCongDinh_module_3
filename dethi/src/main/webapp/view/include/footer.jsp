<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 12/20/2022
  Time: 4:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>footer</title>
    <link rel="stylesheet" href="../bootstrap-5.1.3-dist\css\bootstrap.css">
</head>

<body>
<div class="container-fluid" style="background: #046056">
    <div class="row ">
        <div class="col-lg-4 col-light">
            <div class="d-flex flex-column flex-md-row flex-lg-column">
            </div>
            <div class="mt-3 mt-md-1 mt-lg-3"></div>
            <h4 class="mb-1 mb-md-2">Local Places</h4>
            <table class="place-table">
                <tbody>
                <tr>
                    <td>1.</td>
                    <td>The former imperial city of HUE</td>
                    <td class="text-right"><span>2 hours</span></td>
                </tr>
                <tr>
                    <td>2.</td>
                    <td>The ancient Hoi An</td>
                    <td class="text-right"><span>30 minutes</span></td>
                </tr>
                <tr>
                    <td>3.</td>
                    <td>Champa civilization, My Son</td>
                    <td class="text-right"><span> 90 minutes</span></td>
                </tr>
                <tr>
                    <td>4.</td>
                    <td>Phong Nha Caves</td>
                    <td class="text-right"><span>3 hours</span></td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="col-lg-7 ml-lg-auto d-flex flex-column position-static">
            <div class="row">
                <div class="col-sm col-lg-5">
                    <div id="nav_menu-1" class="footer-widget4  widget_nav_menu">
                        <div id="text-5" class="footer-widget4  widget_text">
                            <div class="textwidget"></div>
                        </div>
                    </div>
                    <div class="col-sm mt-2 mt-sm-0">
                        <a href="https://www.facebook.com/furamaresort/" target="_blank" rel="noopener"><img
                                style="width: 32px;height: 32px;float: left"
                                src="https://furamavietnam.com/wp-content/uploads/2019/06/incon-Facbook-1.png"
                                alt="" width="32" height="32"/></a><a
                            href="https://www.instagram.com/furama_resort_danang/?hl=vi" target="_blank"
                            rel="noopener"><img style="width: 40px;height: 32px;float: left"
                                                src="https://furamavietnam.com/wp-content/uploads/2019/06/social-ins.png"
                                                alt="" width="40" height="32"/></a><a
                            href="https://www.youtube.com/user/furamaresortvietnam/featured" target="_blank"
                            rel="noopener"><img style="width: 40px;height: 32px;float: left"
                                                src="https://furamavietnam.com/wp-content/uploads/2021/10/social-youtube.png"
                                                alt="" width="40" height="32"/></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row mt-5 mb-1 mt-lg-auto mb-md-0 align-items-center">
                <div class="col-sm-auto col-lg-12 col-xl-auto">
                    <div class="footer-copyright text-left">
                        <img src="https://furamavietnam.com/wp-content/uploads/2019/02/Ariyana-Tourism-Complex-02-2.png"
                             alt="Ariyana Tourism Complex" width="500px;">
                        <div class="clearfix d-md-none"></div>
                        © 2022 Furama Resort Danang.
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">


    var js_script = document.createElement('script');
    js_script.type = "text/javascript";
    js_script.src = "//maps.google.com/maps/api/js?sensor=true&callback=init";
    js_script.async = true;
    document.getElementsByTagName('head')[0].appendChild(js_script);


    function init() {
        var mapOptions = {
            zoom: parseInt(8),
            center: new google.maps.LatLng(16.039455, 108.2476223), // New York
            styles: [
                {
                    "featureType": "landscape.natural",
                    "elementType": "geometry.fill",
                    "stylers": [
                        {
                            "visibility": "on"
                        },
                        {
                            "color": "#e0efef"
                        }
                    ]
                },
                {
                    "featureType": "poi",
                    "elementType": "geometry.fill",
                    "stylers": [
                        {
                            "visibility": "on"
                        },
                        {
                            "hue": "#1900ff"
                        },
                        {
                            "color": "#c0e8e8"
                        }
                    ]
                },
                {
                    "featureType": "road",
                    "elementType": "geometry",
                    "stylers": [
                        {
                            "lightness": 100
                        },
                        {
                            "visibility": "simplified"
                        }
                    ]
                },
                {
                    "featureType": "road",
                    "elementType": "labels",
                    "stylers": [
                        {
                            "visibility": "off"
                        }
                    ]
                },
                {
                    "featureType": "transit.line",
                    "elementType": "geometry",
                    "stylers": [
                        {
                            "visibility": "on"
                        },
                        {
                            "lightness": 700
                        }
                    ]
                },
                {
                    "featureType": "water",
                    "elementType": "all",
                    "stylers": [
                        {
                            "color": "#7dcdcd"
                        }
                    ]
                }
            ]
        }
    }

</script>
<script src="../bootstrap-5.1.3-dist\js\bootstrap.js"></script>

</body>
</html>