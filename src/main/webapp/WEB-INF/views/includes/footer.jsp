<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<style>
.fsite-footer-bottom {
	display: block;
	height: 112px;
	box-sizing: border-box;
    background-color: #5a6f80;
    z-index: 2;
    margin: 0;
    color: #212529;
    text-align: var(--bs-body-text-align);
    -webkit-text-size-adjust: 100%;
    -webkit-tap-highlight-color: transparent;
}
.fsite-footer-bottom h5{
    font-family: var(--bs-body-font-family);
    font-size: 16px;
    font-weight: 400;
    line-height: 1.5;
    
}
@media (min-width: 576px){
    .fcontainer {
        max-width: 540px;
    }
}@media (min-width: 768px){
    .fcontainer {
        max-width: 720px;
    }
}
@media (min-width: 992px){
    .fcontainer {
        max-width: 960px;
    }
}
@media (min-width: 1200px){
    .fcontainer {
        max-width: 1140px;
    }
}
@media (min-width: 1400px){
    .fcontainer {
        max-width: 1320px;
    }
}
.fcontainer {
    --bs-gutter-x: 1.5rem;
    --bs-gutter-y: 0;
    width: 100%;
    padding-right: calc(var(--bs-gutter-x) * .5);
    padding-left: calc(var(--bs-gutter-x) * .5);
    margin-right: auto;
    margin-left: auto;
}
.frow {
    --bs-gutter-x: 1.5rem;
    --bs-gutter-y: 0;
    display: flex;
    flex-wrap: wrap;
    margin-top: calc(-1 * var(--bs-gutter-y));
    margin-right: calc(-.5 * var(--bs-gutter-x));
    margin-left: calc(-.5 * var(--bs-gutter-x));
}
@media (min-width: 768px){
    .fcol-md-7 {
        flex: 0 0 auto;
        width: 58.33333333%;
    }
}
@media (min-width: 992px){
    .fcol-lg-6 {
        flex: 0 0 auto;
        width: 50%;
    }
}
.fcol-12 {
    flex: 0 0 auto;
    width: 100%;
}
.frow>* {
    flex-shrink: 0;
    width: 100%;
    max-width: 100%;
    padding-right: calc(var(--bs-gutter-x) * .5);
    padding-left: calc(var(--bs-gutter-x) * .5);
    margin-top: var(--bs-gutter-y);
}
.fcopyright-text {
    color: #f0f8ff;
    font-size: 14px;
    margin-right: 30px;
    margin-top:30px;
}
.fmb-0 {
    margin-bottom: 0!important;
}
.frow>p {
    color: #717275;
    font-size: 16px;
    font-weight: 300;
}
.frow>p {
    margin-top: 0;
    margin-bottom: 1rem;
}
.fsite-footer-bottom>a {
    color: #ffffff;
}
.fcopyright-text>a {
    color: #ffffff;
    text-decoration: none;
}
.fsite-footer-bottom a:hover {
    color: #FF6;
}
.fcopyright-text>a {
    touch-action: manipulation;
    transition: all 0.3s;
}
.fmx-auto {
    margin-right: auto!important;
    margin-left: auto!important;
}
.falign-items-center {
    align-items: center!important;
}
.fjustify-content-center {
    justify-content: center!important;
}
.fd-flex {
    display: flex!important;
}
@media (min-width: 992px){
	.fcol-lg-6 {
	    flex: 0 0 auto;
	    width: 50%;
	}
}
@media (min-width: 768px){
	.fcol-md-5 {
	    flex: 0 0 auto;
	    width: 41.66666667%;
	}
}
footer{
position:relative;
transform:translateY:(-100%);
}
.fmb-3 {
    margin-bottom: 1rem!important;
}

.fsite-footer-title {
	color: skyblue;
    font-size: 24px;
    font-weight: 600;
    letter-spacing: -1px;
     margin-top: 0;
    margin-bottom: 0.5rem;
    font-weight: 500;
    line-height: 1.2;
    display: block;
    font-size: 0.83em;
    margin-block-start: 1.67em;
    margin-block-end: 1.67em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
.ftext-white {
    --bs-text-opacity: 1;
    color: rgba(255,255,255,var(--bs-text-opacity))!important;
}

</style>
</head>
<body>
<footer>
    <div class="fsite-footer-bottom">
        <div class="fcontainer">
            <div class="frow">

                <div class="fcol-lg-6 fcol-md-7 fcol-12">
                    <p class="fcopyright-text fmb-0">Copyright © 2023 하우헌옷 
                    Design : TemplateMo<br>
                        github : <a href='https://github.com/sajo4jo' target="_blank">https://github.com/sajo4jo</a>
                    </p>
                </div>

                <div class="fcol-lg-6 fcol-md-5 fcol-12 fjustify-content-center falign-items-center fmx-auto">
                    <h5 class="fsite-footer-title fmb-3">팀원</h5>
                    <p class="ftext-white fd-flex fmt-3">
                        <i class="fbi-geo-alt fme-2"></i>
                        김갑경, 김문진, 김해나, 조정학, 홍소미
                    </p>
                </div>

            </div>
        </div>
    </div>
</footer>
</body>
</html>