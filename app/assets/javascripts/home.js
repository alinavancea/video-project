$(document).ready(function(){
    $('#submit_comment').click(function(){
        $.ajax({
            url: '/submit_comment',
            type: 'post',
            dataType: 'json',
            data: $('#submit_comment_form').serialize(),
            success: function(result){
                unlock_videos(result);
                
                $('#counter').html("There are "+result.counter+" comments.");

                var comments = "";
                for(var i=result.counter-1;i>=0 && i>=result.counter-5;--i)
                    comments += "<div>"+result.comments[i].text+"</div><br/>";
                $('#show_comments').html(comments);
                $('#text').attr("value","#"+result.text+" ");
            }
        });
        return false;
    });

    // on click on small video play video in the large iframe
    $(".small" ).click( function(){
                    var unlocked_iframe = $(".no-video");
                    var image_url = $( this ).attr("src");
        $.ajax({
            url: "/is_unlocked?video_id=" + $( this ).attr("rel"),
            type: 'POST',
            success: function( result ){
                if ( result == "ok" )
                {
                    console.log("ok")

                    unlocked_iframe.html("<iframe id='unlocked_iframe' class='big' src=' " + get_embed_video_url( image_url) +"' frameborder='0' allowfullscreen></iframe>");
                }
                else
                    {
                        alert("This video is unlocked!");
                    }
            }
        });
        
    });
});
// unlock videos
function unlock_videos(result)
{
    //console.log(result);
    var num_videos = parseInt( parseInt( result.counter ) / parseInt( result.unlock_rule ) );
    var i = 0;
    var videos = $(".small");

    for( i = 0; i < num_videos; i++ )
    {
        var lock = $(".lock#" + i);
        if( lock.length != 0 )
        {
            $(".lock#" + i).removeClass("lock");
        }
    }

    
}
function get_embed_video_url(image_url)
{
    var video_id = image_url.split("/")[4];
    var video_url = "http://www.youtube.com/embed/" + video_id;
    return video_url
}