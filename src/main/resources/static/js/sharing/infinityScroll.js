var loading = false;
var scrollPage = 1;

$(document).ready(function(){  
    surveyList(scrollPage);

    // Scroll
    $(window).scroll(function(){
        var scrollNow = $(window).scrollTop();

        if (scrollNow + $(window).height() + 100 >= $('#sharingList').height()){
            surveyList(scrollPage);
        }
    })
})

function surveyList(page){
    if (!loading){
        loading = true;
        $.ajax({
            url:"http://localhost:8080/api/surveyList.do",
            type:"get",
            data:{"page":page},
            dataType:"html",
            success:function(res){
                $("#sharingList .card-list .card").append(res);
                loading = false;
                scrollPage += 1;
            }
        })
    }
}